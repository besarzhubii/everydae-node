module.exports = (sequelize, DataTypes) => {
  const Challenges = sequelize.define("users", {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    challenge_name: {
      type: DataTypes.STRING,
    },
    question_text: {
      type: DataTypes.STRING,
    },
    createdAt: {
      type: DataTypes.DATE,
    },
    updatedAt: {
      type: DataTypes.DATE,
    },
  });
  return Challenges;
};
