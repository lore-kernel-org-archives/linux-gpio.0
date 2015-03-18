From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: Remove r8a7790 platform_device_id entry
Date: Wed, 18 Mar 2015 02:19:21 +0100
Message-ID: <CACRpkdZHMjCjB91EFXpzgepErwqrigfjcve2MHte1dV1wuqzpQ@mail.gmail.com>
References: <1425986080-26648-1-git-send-email-geert+renesas@glider.be>
	<1425986080-26648-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1425986080-26648-2-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 10, 2015 at 12:14 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The r8a7790 platform is now DT-only, the driver doesn't need to match
> platform devices by name anymore. Remove the corresponding
> platform_device_id entry.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> The r8a7790 platform is DT-only since v4.0-rc1.

Patch applied with Laurent's ACK.

Yours,
Linus Walleij
