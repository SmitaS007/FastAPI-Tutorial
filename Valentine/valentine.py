import webbrowser
import tempfile

def valentines_invite_browser(husband_name):
    html_content = f"""
    <!DOCTYPE html>
    <html>
    <head>
        <title>Valentine's Invite 💖</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {{
                background: linear-gradient(135deg, #ff758c, #ff7eb3);
                font-family: 'Segoe UI', sans-serif;
                text-align: center;
                padding: 20px;
            }}
            .card {{
                background: white;
                padding: 30px;
                border-radius: 25px;
                box-shadow: 0 15px 30px rgba(0,0,0,0.3);
                max-width: 500px;
                margin: auto;
                animation: popIn 1.5s;
            }}
            h1 {{
                color: #e6005c;
            }}
            p {{
                font-size: 18px;
            }}
            button {{
                padding: 15px 25px;
                border-radius: 30px;
                font-size: 16px;
                cursor: pointer;
                border: none;
                margin: 10px;
            }}
            #yes {{
                background: #e6005c;
                color: white;
            }}
            #no {{
                background: #999;
                color: white;
                position: absolute;
            }}
            #countdown {{
                font-size: 20px;
                margin-top: 15px;
                color: #cc0052;
            }}
            @keyframes popIn {{
                from {{ opacity: 0; transform: scale(0.8); }}
                to {{ opacity: 1; transform: scale(1); }}
            }}
        </style>
    </head>

    <body>

        <!-- Bollywood Romantic Music -->
        <audio autoplay loop>
            <source src="https://pagalworldi.com/files/download/id/1349" type="audio/mpeg">
        </audio>

        <div class="card">
            <h1>💌 Valentine’s Invitation 💌</h1>
            <p>Dear <b>{husband_name}</b> ❤️</p>
            <p>Will you be my Valentine forever & always? 💕</p>

            <p>📅 February 14</p>
            <p>🍽️ Food + Love + Unlimited Cuddles</p>

            <div id="countdown"></div>

            <button id="yes" onclick="accepted()">YES 💖</button>
            <button id="no" onmouseover="moveButton()">NO 😜</button>

            <p style="margin-top:20px;"><i>No escape allowed 😎</i></p>
        </div>

        <script>
            function accepted() {{
                alert("💍 Yayyyy! Best husband ever 😘 See you on Valentine’s Day 💖");
            }}

            function moveButton() {{
                const button = document.getElementById("no");
                const x = Math.random() * (window.innerWidth - 100);
                const y = Math.random() * (window.innerHeight - 100);
                button.style.left = x + "px";
                button.style.top = y + "px";
            }}

            const valentineDate = new Date("Feb 14, 2026 00:00:00").getTime();
            const timer = setInterval(function() {{
                const now = new Date().getTime();
                const distance = valentineDate - now;

                const days = Math.floor(distance / (1000 * 60 * 60 * 24));
                const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                const seconds = Math.floor((distance % (1000 * 60)) / 1000);

                document.getElementById("countdown").innerHTML =
                "⏳ Countdown: " + days + "d " + hours + "h " +
                minutes + "m " + seconds + "s ";

                if (distance < 0) {{
                    clearInterval(timer);
                    document.getElementById("countdown").innerHTML = "💘 It’s Valentine’s Day 💘";
                }}
            }}, 1000);
        </script>

    </body>
    </html>
    """

    with tempfile.NamedTemporaryFile('w', delete=False, suffix='.html', encoding = 'utf-8') as file:
        file.write(html_content)
        file_path = file.name

    webbrowser.open(f'file://{file_path}')

# 💖 Run it
valentines_invite_browser("My Forever Valentine 😘")