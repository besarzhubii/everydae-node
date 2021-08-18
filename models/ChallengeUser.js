module.exports = (sequelize, DataTypes) => {
  const ChallengeUser = sequelize.define("challenge_users", {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: false,
    },
    stopped_time: {
      type: DataTypes.DATE,
    },
    completed_at_time: {
      type: DataTypes.DATE,
    },
    challenge_id: {
      type: DataTypes.INTEGER,
    },
    createdAt: {
      type: DataTypes.DATE,
    },
    updatedAt: {
      type: DataTypes.DATE,
    },
  });

  ChallengeUser.associate = (models) => {
    ChallengeUser.belongsToMany(models.users, {
      through: "id",
    });
  };

  return ChallengeUser;
};
