From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: core: don't open code of_device_get_match_data()
Date: Wed, 9 Mar 2016 10:47:31 +0700
Message-ID: <CACRpkdY3Tv8ieTJSEesm06B_pvZHTmLvBFNGJFKneO=ZOjUPLw@mail.gmail.com>
References: <1456850332-8432-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1456850332-8432-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 1, 2016 at 11:38 PM, Wolfram Sang <wsa@the-dreams.de> wrote:

> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> This change will also make Coverity happy by avoiding a theoretical NULL
> pointer dereference; yet another reason is to use the above helper function
> to tighten the code and make it more readable.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Patch applied with Geert's ACK.

Yours,
Linus Walleij
