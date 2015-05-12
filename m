From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: x-gene: Remove a useless memset
Date: Tue, 12 May 2015 09:43:42 +0200
Message-ID: <CACRpkdbmn0O4cDByE6pWjwcfs3hW7-jtori83L5oeTumpZYGVQ@mail.gmail.com>
References: <1430483346-10583-1-git-send-email-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430483346-10583-1-git-send-email-christophe.jaillet@wanadoo.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Fri, May 1, 2015 at 2:29 PM, Christophe Jaillet
<christophe.jaillet@wanadoo.fr> wrote:

> priv->irq is allocated using devm_kzalloc so there is no need to memset it.
>
> Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>

Patch applied.

Yours,
Linus Walleij
