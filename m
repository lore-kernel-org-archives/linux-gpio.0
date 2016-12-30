From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: sirf: atlas7: Add missing 'of_node_put()'
Date: Fri, 30 Dec 2016 09:13:42 +0100
Message-ID: <CACRpkdZP1E6Br=oiqxR1hOxSacUBDCkKW5dhuiXBvxrERXpx0g@mail.gmail.com>
References: <20161220054043.25417-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161220054043.25417-1-christophe.jaillet@wanadoo.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Barry Song <baohua@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Dec 20, 2016 at 6:40 AM, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> Reference to 'sys2pci_np' should be dropped in all cases here, not only in
> error handling path.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied.

Yours,
Linus Walleij
