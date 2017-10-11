From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: remove unused pin_base
Date: Wed, 11 Oct 2017 09:54:49 +0200
Message-ID: <CACRpkda7z==geUfZFGRXHiVLPaUcZU6s9Pub2VSa4UNuEUr4fw@mail.gmail.com>
References: <20171006085407.27905-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171006085407.27905-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 6, 2017 at 10:54 AM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> While removing the need to have pin_base defined in meson pinctrl
> drivers, I forgot to remove the corresponding field from the
> pinctrl_data structure.
>
> Fixing this now.
>
> Fixes: 70e5ecb1b994 ("pinctrl: meson: get rid of pin_base")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch applied with Kevin's reviewed-by.

Yours,
Linus Walleij
