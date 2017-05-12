From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: imx: Check for memory allocation failure
Date: Fri, 12 May 2017 11:11:27 +0200
Message-ID: <CACRpkdYAqmDDq-UgQUecfquBdSCVHR1=rd96Cx3LT=ySgBXqpg@mail.gmail.com>
References: <20170506082359.6736-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170506082359.6736-1-christophe.jaillet@wanadoo.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, ext Tony Lindgren <tony@atomide.com>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sat, May 6, 2017 at 10:23 AM, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> If 'devm_kzalloc' fails, a NULL pointer will be dereferenced.
> Return -ENOMEM instead, as done for the other memory allocation just a
> few lines below.
> BTW, change the 'devm_kzalloc' into a 'devm_kcalloc'.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied.

Yours,
Linus Walleij
