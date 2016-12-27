From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [RFC v2 2/3] pinctrl: imx: use radix trees for groups and functions
Date: Tue, 27 Dec 2016 11:11:40 -0200
Message-ID: <CAOMZO5C863F4YptxGem+3WFteZ=RgYnqr3D9QDKBqu16qPm7NQ@mail.gmail.com>
References: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
 <20161202163520.22927-1-gary.bisson@boundarydevices.com> <20161202163520.22927-3-gary.bisson@boundarydevices.com>
 <CACRpkdYvE1mGKi1uyEK0U9hvm5kgpjM9ZUAp3wL3f+LxO-0MHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYvE1mGKi1uyEK0U9hvm5kgpjM9ZUAp3wL3f+LxO-0MHw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Dec 27, 2016 at 11:05 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Fri, Dec 2, 2016 at 5:35 PM, Gary Bisson
> <gary.bisson@boundarydevices.com> wrote:
>
>> This change is inspired from the pinctrl-single architecture.
>>
>> The problem with current implementation is that it isn't possible
>> to add/remove functions and/or groups dynamically. The radix tree
>> offers an easy way to do so. The intent is to offer a follow-up
>> patch later that will enable the use of pinctrl nodes in dt-overlays.
>>
>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>
> I would like some ACK from the i.MX pinctrl maintainers.
>
> Fabio, do you have the context you need to ack/nack this?

Looks good:

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
