From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: Add devicetree bindings for
 MT6797 SoC Pinctrl
Date: Wed, 5 Dec 2018 13:00:52 +0100
Message-ID: <CACRpkdYCsh3AfmV-7ym-ffjp2k-kaNRqY1O3rd9h-WoUPYM_bw@mail.gmail.com>
References: <20181107174844.5381-1-manivannan.sadhasivam@linaro.org>
 <20181107174844.5381-2-manivannan.sadhasivam@linaro.org> <CACRpkda25cuiPCe9ouvDDSpFwZ2z=Pm8pK=5jC-7OAcYwPSvvA@mail.gmail.com>
 <c1f63dd8-1c06-1797-025c-2cd4891d905d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c1f63dd8-1c06-1797-025c-2cd4891d905d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, arm-soc <arm@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, sean.wang@kernel.org, Rob Herring <robh+dt@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 3, 2018 at 2:08 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> On 15/11/2018 11:04, Linus Walleij wrote:
> > On Wed, Nov 7, 2018 at 6:49 PM Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org> wrote:
> >
> >> Add devicetree bindings for Mediatek MT6797 SoC Pin Controller.
> >>
> >> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >
> > Patch applied.
> >
>
> Could you provide a stable tree for me, so that I can take the dts parts?
> I just realized that my build is broken because of the missing dt-bindings
> header file.

Since I pulled other changes on top it is too late for me to put that
in an immutable branch and merge into my tree separately,
you would have to pull in the whole "devel" branch from the
pin control tree.

What we sometimes do is simply apply the *EXACT* same patch
to two git trees. Git will cope with that as long as they are
absolutely *IDENTICAL*. (The patch will appear twice in the
git log with different hashes but they will merge without
problems, a bit unelegant but it works.)

So in your situation I would extract this patch from the pinctrl
tree:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?h=devel&id=95d2f00657ad4c2c3eacd8a871a7aa022c3fe7d9
and apply it with some notice to the maintainers about
the situation.

ARM SoC folks: agreed?

Yours,
Linus Walleij
