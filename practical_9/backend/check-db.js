const mongoose = require('mongoose');
const User = require('./models/User');

async function checkDatabase() {
    try {
        await mongoose.connect('mongodb://localhost:27017/flutter_auth_db');
        console.log('✅ Connected to MongoDB');

        const users = await User.find({});
        console.log(`📊 Found ${users.length} users in database:`);

        users.forEach((user, index) => {
            console.log(`${index + 1}. Name: ${user.name}, Email: ${user.email}`);
        });

        if (users.length === 0) {
            console.log('⚠️  No users found. You need to register first!');
        }

        await mongoose.disconnect();
        console.log('✅ Database connection closed');
    } catch (error) {
        console.error('❌ Database error:', error.message);
    }
}

checkDatabase();