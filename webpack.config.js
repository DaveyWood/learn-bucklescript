// copied from: https://raw.githubusercontent.com/webpack/example-app/master/webpack.config.js

var webpack = require("webpack");
var path = require("path");
module.exports = {
	context: __dirname,
	entry: "./index.js",
	output: {
		path: path.join(__dirname, "assets"),
		publicPath: "assets/", // relative path for github pages
		filename: "main.js", // no hash in main.js because index.html is a static page
		chunkFilename: "[hash]/js/[id].js",
		hotUpdateMainFilename: "[hash]/update.json",
		hotUpdateChunkFilename: "[hash]/js/[id].update.js"
	},
	recordsOutputPath: path.join(__dirname, "records.json"),
	module: {
		loaders: [
			{ test: /\.css$/,    loader: "style-loader!css-loader" },
			{ test: /\.less$/,   loader: "style-loader!css-loader!less-loader" },
		]
	},
	resolve: {
		fallback: path.join(__dirname, "jam")
	},
	amd: { jQuery: true },
	plugins: [
		new webpack.optimize.LimitChunkCountPlugin({ maxChunks: 20 })
	],
	fakeUpdateVersion: 0
};
