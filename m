From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: mb86s7x: Handle return value of clk_prepare_enable.
Date: Mon, 7 Aug 2017 11:08:45 +0200
Message-ID: <CACRpkdYuXo3OeLMJh5boqEH4zYUG6tS=5sX8o7g_N25BGYsXTQ@mail.gmail.com>
References: <e84a2b010f0632369030f92fa30572ba1e4aaaf2.1501569628.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e84a2b010f0632369030f92fa30572ba1e4aaaf2.1501569628.git.arvind.yadav.cs@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 1, 2017 at 8:43 AM, Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:

> clk_prepare_enable() can fail here and we must check its return value.
>
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

Patch applied.

Yours,
Linus Walleij
