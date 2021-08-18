module.exports = (sequelize, DataTypes) => {
  const Parents = sequelize.define("parents", {
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
    createdAt: {
      type: DataTypes.DATE,
    },
    updatedAt: {
      type: DataTypes.DATE,
    },
  });

  Parents.associate = (models) => {
    Parents.hasMany(models.users, {
      foreignKey: "parent_id",
      sourceKey: "id",
      as: "users",
    });
  };
  return Parents;
};
