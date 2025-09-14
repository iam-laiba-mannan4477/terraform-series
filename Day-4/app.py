from flask import Flask, jsonify, request, render_template_string

app = Flask(__name__)

# Homepage
@app.route("/")
def home():
    return "<h1>Welcome to Terraform Flask App 🚀</h1><p>Go to /about, /users, or /form</p>"

# About page
@app.route("/about")
def about():
    return "This Flask app is deployed using Terraform on AWS EC2!"

# JSON API route
@app.route("/users")
def users():
    data = {
        "users": [
            {"id": 1, "name": "Laiba", "role": "DevOps Engineer"},
            {"id": 2, "name": "Mannan", "role": "Cloud Enthusiast"}
        ]
    }
    return jsonify(data)

# Simple form example
@app.route("/form", methods=["GET", "POST"])
def form():
    if request.method == "POST":
        name = request.form.get("name")
        return f"<h2>Hello, {name}! 🎉</h2>"
    return render_template_string('''
        <form method="POST">
            <label>Enter your name:</label>
            <input type="text" name="name" required>
            <button type="submit">Submit</button>
        </form>
    ''')

# Custom error handler
@app.errorhandler(404)
def not_found(e):
    return "<h1>404 😢</h1><p>The page you’re looking for doesn’t exist.</p>", 404

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
