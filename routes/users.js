const express = require("express");
const app = express();
const db = require("../models");
const moment = require("moment");

const getFirstDayOfWeek = () => moment().startOf("isoWeek");

app.get("/getusersbyparent/:parentid", async (req, res) => {
  try {
    const users = await db.parents.findOne({
      where: {
        id: req.params.parentid,
      },
      attributes: ["fname", "lname"],
      include: [
        { model: db.users, as: "users", attributes: ["id", "fname", "lname"] },
      ],
    });
    if (users) {
      res.send(users);
    } else {
      res.status(404).send({
        err: true,
        msg: "Sorry no user was found please try refreshing the page or with another id!",
      });
    }
  } catch (err) {
    console.log(err);
    res.send({ err: true, msg: "Something went wrong please try again!" });
  }
});

app.get("/getusersstatistics/:userid", async (req, res) => {
  const monday = moment(getFirstDayOfWeek()).format("yyyy-MM-DD 00:00:00");
  const today = moment(new Date()).format("yyyy-MM-DD HH:mm:ss");
  const { userid } = req.params;
  let users;
  try {
    users = await db.users.findOne({
      where: {
        id: userid,
      },
      attributes: ["target_sat_score", "days_until_exam"],
      include: [
        {
          model: db.challenge_users,
          as: "challenges",
          where: {
            [db.Sequelize.Op.and]: [
              {
                completed_at_time: {
                  [db.Sequelize.Op.ne]: null,
                },
              },
              {
                completed_at_time: {
                  [db.Sequelize.Op.between]: [monday, today],
                },
              },
            ],
          },
          required: false,
        },
      ],
    });
  } catch (err) {
    console.log(err);
    res.send({ err: true, msg: "Something went wrong please try again!" });
  }
  let totalHoursSpent;
  try {
    totalHoursSpent = await db.challenge_users.findAll({
      where: [
        {
          user_id: userid,
        },
      ],
      attributes: [
        [
          db.sequelize.literal(
            `SUM(CASE WHEN stopped_time is null then TIMESTAMPDIFF(SECOND,start_time,completed_at_time) else TIMESTAMPDIFF(SECOND,start_time,stopped_time) END)/3600`
          ),

          "total_time",
        ],
      ],
    });
    let finalObj = {
      target_sat_score: users.target_sat_score,
      days_until_exam: users.days_until_exam,
      total_finished: users.challenges.length,
      hours_spent: totalHoursSpent[0].dataValues.total_time
        ? parseFloat(totalHoursSpent[0].dataValues.total_time).toFixed(2)
        : 0,
    };
    res.send(finalObj);
  } catch (err) {
    console.log(err);
    res.send({ err: true, msg: "Something went wrong please try again!" });
  }
});

module.exports = app;
