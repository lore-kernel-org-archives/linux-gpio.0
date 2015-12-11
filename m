From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 158/182] leds: pca9532: use gpiochip data pointer
Date: Fri, 11 Dec 2015 19:39:30 +0100
Message-ID: <CACRpkdZxtQQpV5w51Km8wVytFtDZui_qQeMsRoVq6rEW9xt0QA@mail.gmail.com>
References: <1449668770-5933-1-git-send-email-linus.walleij@linaro.org>
	<56683AC3.6070300@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
In-Reply-To: <56683AC3.6070300@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Riku Voipio <riku.voipio@iki.fi>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Dec 9, 2015 at 3:29 PM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:

> This applies only with 3-way merge due to work queue removal related
> changes that already sit on LED git. Nothing clever can be done to fix
> that since those changes depend on LED core changes and this patch
> depends on GPIO changes. We'll need to add relevant remarks in the pull
> requests.

OK we will notice it in linux-next first I guess, so CC:in that list.
I plan to merge this into the GPIO tree next week.

Yours,
Linus Walleij
