from flask import Flask, request, jsonify
from newspaper import Article

app = Flask(__name__)

@app.route("/extract", methods=["POST"])
def extract():
    url = request.json.get("url")
    if not url:
        return jsonify({"error": "No URL provided"}), 400

    try:
        article = Article(url)
        article.download()
        article.parse()

        return jsonify({
            "title": article.title,
            "text": article.text,
            "authors": article.authors,
            "publish_date": str(article.publish_date)
        })
    except Exception as e:
        return jsonify({"error": str(e)}), 500
