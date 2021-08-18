module.exports = (sequelize, DataTypes) => {
  const Users = sequelize.define("users", {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    fname: {
      type: DataTypes.STRING,
      allowNull: false,
      autoIncrement: false,
    },
    lname: {
      type: DataTypes.STRING,
      allowNull: false,
      autoIncrement: false,
    },
    target_sat_score: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: false,
    },
    days_until_exam: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: false,
    },
    parent_id: {
      type: DataTypes.INTEGER,
      references: {
        model: "parents",
        key: "id",
      },
    },
    createdAt: {
      type: DataTypes.DATE,
    },
    updatedAt: {
      type: DataTypes.DATE,
    },
  });

  Users.associate = (models) => {
    Users.belongsToMany(models.parents, {
      through: "id",
    });
    Users.hasMany(models.challenge_users, {
      foreignKey: "user_id",
      sourceKey: "id",
      as: "challenges",
    });
  };
  return Users;
};
