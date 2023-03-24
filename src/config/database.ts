import mongoose from 'mongoose';

import env from 'config/env';

const connectDB = async () => {
  const { uri } = env.mongo;

  try {
    mongoose.set('strictQuery', false);
    await mongoose.connect(uri);
    console.log('Connected to MongoDB');
  } catch (err) {
    console.log(err);
  }
};

export default connectDB;
