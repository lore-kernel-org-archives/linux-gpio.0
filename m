From: Yong Li <sdliyong@gmail.com>
Subject: Re: [PATCH v3] pinctrl: aspeed: Fix ast2500 strap register write logic
Date: Thu, 17 Aug 2017 07:54:41 -0700
Message-ID: <CADO9-pfZ=9JQbH1pJJBe2HPf5EKB+a+vwCUjiMA+C=bhsu7QVQ@mail.gmail.com>
References: <1502814110-90168-1-git-send-email-sdliyong@gmail.com>
 <1502891140.681.6.camel@aj.id.au> <CADO9-pdF6ZP1me=h9ZzTNNk+ue02dJrf8h=yBk2fsJnWqGKmhg@mail.gmail.com>
 <1502939992.681.9.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502939992.681.9.camel@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, joel@jms.id.au, Arnd Bergmann <arnd@arndb.de>, Rick Altherr <raltherr@google.com>, robh@kernel.org, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Thanks Andrew for your thoughtful input. Let me send out another version :)

2017-08-16 20:19 GMT-07:00 Andrew Jeffery <andrew@aj.id.au>:
> Hi Yong,
>
> On Wed, 2017-08-16 at 08:05 -0700, Yong Li wrote:
>> Hi Andrew,
>>
>> Thanks for your review. I checked the patch before I sent out, but the
>> tool did not report any problems. Could you help to share your
>> checking commands?
>>
>> scripts/checkpatch.pl
>> 0001-pinctrl-aspeed-Fix-ast2500-strap-register-write-logi.patch
>> total: 0 errors, 0 warnings, 38 lines checked
>
> Gah, turns out it was a problem with my mail client, which violates RFC41=
55 and
> writes an mbox with CRLF. Awesome.
>
> I grabbed the mbox from patchwork and it was fine. Sorry for the noise.
>
> Separately, I slept on this and think there's a remaining issue. I'll out=
line
> it below in context.
>
>>
>> Thanks,
>> Yong
>>
>> > 2017-08-16 6:45 GMT-07:00 Andrew Jeffery <andrew@aj.id.au>:
>> > Hi Yong,
>> >
>> > On Wed, 2017-08-16 at 00:21 +0800, Yong Li wrote:
>> > > On AST2500, the hardware strap register(SCU70) only accepts write =
=E2=80=981=E2=80=99,
>> > > to clear it to =E2=80=980=E2=80=99, must set bits(write  =E2=80=981=
=E2=80=99) to SCU7C
>> > >
>> > > Signed-off-by: Yong Li <sdliyong@gmail.com>
>> >
>> > ./scripts/checkpatch.pl complains about DOS line-endings thoughout -
>> > you should fix your editor to use Unix line endings (at least for
>> > kernel work). Maybe if Linus is feeling charitable he can fix it up fo=
r
>> > you. Regarding the meat of the change:
>> >
>> > > > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>> > > > Tested-by: Andrew Jeffery <andrew@aj.id.au>
>> >
>> > Thanks for the patch!
>> >
>> > Andrew
>> >
>> > > ---
>> > >  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 19 +++++++++++++++++--
>> > >  drivers/pinctrl/aspeed/pinctrl-aspeed.h |  1 +
>> > >  2 files changed, 18 insertions(+), 2 deletions(-)
>> > >
>> > > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinct=
rl/aspeed/pinctrl-aspeed.c
>> > > index a86a4d6..f2d5133 100644
>> > > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
>> > > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
>> > > @@ -183,6 +183,7 @@ static int aspeed_sig_expr_set(const struct aspe=
ed_sig_expr *expr,
>> > >  {
>> > > >     int ret;
>> > > >     int i;
>> > > > +   unsigned int rev_id;
>> > > >     for (i =3D 0; i < expr->ndescs; i++) {
>> > > >             const struct aspeed_sig_desc *desc =3D &expr->descs[i]=
;
>> > >
>> > > @@ -213,8 +214,22 @@ static int aspeed_sig_expr_set(const struct asp=
eed_sig_expr *expr,
>> > > >             if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D =
HW_STRAP2)
>> > > >                     continue;
>> > > > -           ret =3D regmap_update_bits(maps[desc->ip], desc->reg,
>> > > > -                                    desc->mask, val);
>> > > > +           /* On AST2500, Set bits in SCU7C are cleared from SCU7=
0 */
>> > > > +           if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D =
HW_STRAP1) {
>> > > > +                   ret =3D regmap_read(maps[ASPEED_IP_SCU],
>> > > > +                           HW_REVISION_ID, &rev_id);
>> > > > +                   if (ret < 0)
>> > > > +                           return ret;
>> > >
>> > > +
>> > > > +                   if (0x04 =3D=3D ((rev_id >> 24) & 0xff))
>> > > > +                           ret =3D regmap_write(maps[desc->ip],
>> > > > +                                   HW_REVISION_ID, (~val & desc->=
mask));
>> > > > +                   else
>
> Looking back at v2 what you had was correct for the single-bit field case=
 (if
> 'val =3D=3D 0' was false we went and wrote the set bit to HW_STRAP1), and=
 it seems
> I didn't think through my suggestion enough to catch the problem I create=
d.
>
> Essentially we should drop the 'else' above and always perform the
> regmap_update_bits() HW_STRAP1 because it is write-1-set. Otherwise we ca=
n
> only clear bits in the strapping register on the AST2500 and not set them=
.
> However, given the duplication pointed out below, I've suggested a furthe=
r
> rearrangement.
>
>> > > > +                           ret =3D regmap_update_bits(maps[desc->=
ip],
>> > > > +                                   desc->reg, desc->mask, val);
>> > > > +           } else
>> > > > +                   ret =3D regmap_update_bits(maps[desc->ip], des=
c->reg,
>> > > > +                           desc->mask, val);
>
> I note that we're doing the same regmap_update_bits() operation twice in =
two
> separate branches of the code. How about this (note: it's a sketch, and i=
s
> untested)?
>
> (1)     if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_STRAP1) =
{
>                 unsigned int rev_id;
>
> (2)             ret =3D regmap_read(maps[ASPEED_IP_SCU], HW_REVISION_ID, =
&rev_id);
>                 if (ret < 0)
>                         return ret;
>
> (3)             if (((rev_id >> 24) =3D=3D 0x04) {
> (4)                     if (~val & desc->mask) {
> (5)                             ret =3D regmap_write(maps[desc->ip],
>                                                    HW_REVISION_ID,
>                                                    (~val & desc->mask));
>                                 if (ret < 0)
>                                         return ret;
>                         }
>                 }
>         }
>
> (6)     ret =3D regmap_update_bits(maps[desc->ip], desc->reg, desc->mask,=
 val);
>
> So we have a few cases we need to deal with, AST2500 or not, writing to
> HW_STRAP1 or not, and assuming AST2500/HW_STRAP1, setting and clearing bi=
ts. So:
>
> A. AST25xx, only clearing bits in HW_STRAP1:
> The condition at (1) ensures we only perform (2) if we need to, which bec=
ause
> we're modifying HW_STRAP1 state on an AST25xx we do. Thus (3) evaluates t=
rue
> as does (4) due to clearing bits, and we perform a straight regmap_write(=
) at
> (5) due to W1C behaviour. We take a performance penalty by always writing
> HW_STRAP1 at (6) which has no effect as we're only clearing bits. HW_STRA=
P1 is
> modified as desired.
>
> B. AST25xx, only setting bits in HW_STRAP1:
> We pass the conditions at (1) and (3), however (4) evaluates false as we'=
re
> only setting bits. Thus we reach (6), which modifies HW_STRAP1 as desired=
.
>
> C. AST25xx, both setting and clearing bits in HW_STRAP1 (e.g. multi-bit f=
ield):
> We pass the conditions at (1), (3) and (4), issue (5) to clear the bits t=
hen
> hit (6) to write the set bits. HW_STRAP1 is modified as desired.
>
> D. AST25xx, modifying non-HW_STRAP1 registers:
> The condition at (1) fails, we jump straight to (6) and update the regist=
er.
>
> E. AST24xx, clearing bits in HW_STRAP1:
> F. AST24xx, setting bits in HW_STRAP1:
> G. AST24xx, setting and clearing bits in HW_STRAP1:
> We pass the condition at (1), but the value read at (2) gives a failure a=
t (3).
> We jump to (6) and update HW_STRAP1.
>
> H. AST24xx, modifying non-HW_STRAP1 registers:
> The condition at (1) fails, we jump straight to (6) and update the regist=
er
>
> I don't think I've missed any cases there. Can you shoot holes in it? If =
not I
> think that's the approach we should take, despite the redundant write for=
 case
> A. Otherwise the code gets messy.
>
> Sorry that this has turned a small problem into such an exercise. I Hope =
I
> haven't extinguished your drive to get a fix integrated :/ Apologies agai=
n for
> the oversight in my comment on v2.
>
> Cheers,
>
> Andrew
>
>> > > >             if (ret)
>> > > >                     return ret;
>> > >
>> > > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinct=
rl/aspeed/pinctrl-aspeed.h
>> > > index fa125db..d4d7f03 100644
>> > > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
>> > > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
>> > > @@ -251,6 +251,7 @@
>> > >  #define SCU3C           0x3C /* System Reset Control/Status Registe=
r */
>> > >  #define SCU48           0x48 /* MAC Interface Clock Delay Setting *=
/
>> > >  #define HW_STRAP1       0x70 /* AST2400 strapping is 33 bits, is sp=
lit */
>> > > +#define HW_REVISION_ID  0x7C /* Silicon revision ID register */
>> > >  #define SCU80           0x80 /* Multi-function Pin Control #1 */
>> > >  #define SCU84           0x84 /* Multi-function Pin Control #2 */
>> > >  #define SCU88           0x88 /* Multi-function Pin Control #3 */
