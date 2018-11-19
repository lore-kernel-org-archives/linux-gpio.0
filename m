From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: fix pull enable register calculation
Date: Mon, 19 Nov 2018 14:18:19 +0100
Message-ID: <CACRpkdZ=pqxvmQdXhyGTMM9x4-rocwWkwdJv=yduO5WDwQ8z6g@mail.gmail.com>
References: <20181113105536.6459-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181113105536.6459-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 13, 2018 at 11:55 AM Jerome Brunet <jbrunet@baylibre.com> wrote:

> We just changed the code so we apply bias disable on the correct
> register but forgot to align the register calculation. The result
> is that we apply the change on the correct register, but possibly
> at the incorrect offset/bit
>
> This went undetected because offsets tends to be the same between
> REG_PULL and REG_PULLEN for a given pin the EE controller. This
> is not true for the AO controller.
>
> Fixes: e39f9dd8206a ("pinctrl: meson: fix pinconf bias disable")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch applied for fixes.

Yours,
Linus Walleij
