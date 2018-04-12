From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH] pinctrl: msm: fix gpio-hog related boot issues
Date: Thu, 12 Apr 2018 21:05:59 +0200
Message-ID: <3015969.TLpigVpPJ0@debian64>
References: <20180328180705.29147-1-chunkeey@gmail.com>
 <CACRpkdacDjzF=CR59by8Zd44wJD12Sr5FSTd=Ph_eSH2QYZudA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdacDjzF=CR59by8Zd44wJD12Sr5FSTd=Ph_eSH2QYZudA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Sven Eckelmann <sven.eckelmann@openmesh.com>, Andy Gross <andy.gross@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Donnerstag, 12. April 2018 14:48:56 CEST Linus Walleij wrote:
> On Wed, Mar 28, 2018 at 8:07 PM, Christian Lamparter <chunkeey@gmail.com>=
 wrote:
> =

> > -       ret =3D gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->de=
v), 0, 0, chip->ngpio);
> > -       if (ret) {
> > -               dev_err(pctrl->dev, "Failed to add pin range\n");
> > -               gpiochip_remove(&pctrl->chip);
> > -               return ret;
> > -       }
> =

> If you instead of deleteing this, just wrap it inside
> something like:
> =

> if (!of_property_read_bool(np, "gpio-ranges") {
>   (...)
> }
> =

> You will stay compatible with elder device trees, solving Bj=F6rns
> issue. You will only be adding hogs to newer device trees with
> the ranges defined anyway.
> =

> Be genereous with comments in the code if you choose this
> approach so everyone realize what is going on.
Thank you for your insightful advice. I just sent out v4 which
goes the of_property_read_bool route. Let's wait and see what
kbuilt-bot has to say.

Best Regards,
Christian
