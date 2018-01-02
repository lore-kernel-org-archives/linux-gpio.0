From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: at91: Delete an error message for a failed
 memory allocation in at91_pinctrl_mux_mask()
Date: Tue, 2 Jan 2018 09:44:11 +0100
Message-ID: <CACRpkdY2F0AZLJuRNYCMJp9gNAws0-0nVuOAv=3FaHfJRMEUrg@mail.gmail.com>
References: <b5da388b-7fa2-ad77-7b64-26eadd55b41c@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <b5da388b-7fa2-ad77-7b64-26eadd55b41c@users.sourceforge.net>
Sender: kernel-janitors-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sat, Dec 23, 2017 at 8:55 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 23 Dec 2017 20:44:27 +0100
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
