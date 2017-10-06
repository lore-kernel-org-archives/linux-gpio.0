From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] pinctrl: meson: remove unused pin_base
Date: Fri, 06 Oct 2017 16:15:35 -0700
Message-ID: <7hd15z7trc.fsf@baylibre.com>
References: <20171006085407.27905-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171006085407.27905-1-jbrunet@baylibre.com> (Jerome Brunet's
        message of "Fri, 6 Oct 2017 10:54:07 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Carlo Caione <carlo@caione.org>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> While removing the need to have pin_base defined in meson pinctrl
> drivers, I forgot to remove the corresponding field from the
> pinctrl_data structure.
>
> Fixing this now.
>
> Fixes: 70e5ecb1b994 ("pinctrl: meson: get rid of pin_base")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
