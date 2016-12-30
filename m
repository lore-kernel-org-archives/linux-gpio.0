From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC v2 2/3] pinctrl: imx: use radix trees for groups and functions
Date: Fri, 30 Dec 2016 14:25:30 +0100
Message-ID: <CACRpkdb12GBXmdrN=19+GRQaO0392x=x_84C7mpvL3trrGPyMg@mail.gmail.com>
References: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
 <20161202163520.22927-1-gary.bisson@boundarydevices.com> <20161202163520.22927-3-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161202163520.22927-3-gary.bisson@boundarydevices.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Dec 2, 2016 at 5:35 PM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:

> This change is inspired from the pinctrl-single architecture.
>
> The problem with current implementation is that it isn't possible
> to add/remove functions and/or groups dynamically. The radix tree
> offers an easy way to do so. The intent is to offer a follow-up
> patch later that will enable the use of pinctrl nodes in dt-overlays.
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Patch applied with Fabio's ACK.

Yours,
Linus Walleij
