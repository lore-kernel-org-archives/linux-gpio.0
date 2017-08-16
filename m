From: Yong Li <sdliyong@gmail.com>
Subject: Re: [PATCH v3] pinctrl: aspeed: Fix ast2500 strap register write logic
Date: Wed, 16 Aug 2017 08:05:36 -0700
Message-ID: <CADO9-pdF6ZP1me=h9ZzTNNk+ue02dJrf8h=yBk2fsJnWqGKmhg@mail.gmail.com>
References: <1502814110-90168-1-git-send-email-sdliyong@gmail.com> <1502891140.681.6.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502891140.681.6.camel@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, joel@jms.id.au, arnd@arndb.de, Rick Altherr <raltherr@google.com>, robh@kernel.org, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Andrew,

Thanks for your review. I checked the patch before I sent out, but the
tool did not report any problems. Could you help to share your
checking commands?

scripts/checkpatch.pl
0001-pinctrl-aspeed-Fix-ast2500-strap-register-write-logi.patch
total: 0 errors, 0 warnings, 38 lines checked

Thanks,
Yong

2017-08-16 6:45 GMT-07:00 Andrew Jeffery <andrew@aj.id.au>:
> Hi Yong,
>
> On Wed, 2017-08-16 at 00:21 +0800, Yong Li wrote:
>> On AST2500, the hardware strap register(SCU70) only accepts write =E2=80=
=981=E2=80=99,
>> to clear it to =E2=80=980=E2=80=99, must set bits(write  =E2=80=981=E2=
=80=99) to SCU7C
>>
>> Signed-off-by: Yong Li <sdliyong@gmail.com>
>
> ./scripts/checkpatch.pl complains about DOS line-endings thoughout -
> you should fix your editor to use Unix line endings (at least for
> kernel work). Maybe if Linus is feeling charitable he can fix it up for
> you. Regarding the meat of the change:
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Tested-by: Andrew Jeffery <andrew@aj.id.au>
>
> Thanks for the patch!
>
> Andrew
>
>> ---
>>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 19 +++++++++++++++++--
>>  drivers/pinctrl/aspeed/pinctrl-aspeed.h |  1 +
>>  2 files changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/a=
speed/pinctrl-aspeed.c
>> index a86a4d6..f2d5133 100644
>> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
>> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
>> @@ -183,6 +183,7 @@ static int aspeed_sig_expr_set(const struct aspeed_s=
ig_expr *expr,
>>  {
>> >     int ret;
>> >     int i;
>> > +   unsigned int rev_id;
>>
>> >     for (i =3D 0; i < expr->ndescs; i++) {
>> >             const struct aspeed_sig_desc *desc =3D &expr->descs[i];
>> @@ -213,8 +214,22 @@ static int aspeed_sig_expr_set(const struct aspeed_=
sig_expr *expr,
>> >             if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_S=
TRAP2)
>> >                     continue;
>>
>> > -           ret =3D regmap_update_bits(maps[desc->ip], desc->reg,
>> > -                                    desc->mask, val);
>> > +           /* On AST2500, Set bits in SCU7C are cleared from SCU70 */
>> > +           if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=3D HW_S=
TRAP1) {
>> > +                   ret =3D regmap_read(maps[ASPEED_IP_SCU],
>> > +                           HW_REVISION_ID, &rev_id);
>> > +                   if (ret < 0)
>> > +                           return ret;
>> +
>> > +                   if (0x04 =3D=3D ((rev_id >> 24) & 0xff))
>> > +                           ret =3D regmap_write(maps[desc->ip],
>> > +                                   HW_REVISION_ID, (~val & desc->mask=
));
>> > +                   else
>> > +                           ret =3D regmap_update_bits(maps[desc->ip],
>> > +                                   desc->reg, desc->mask, val);
>> > +           } else
>> > +                   ret =3D regmap_update_bits(maps[desc->ip], desc->r=
eg,
>> > +                           desc->mask, val);
>>
>> >             if (ret)
>> >                     return ret;
>> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/a=
speed/pinctrl-aspeed.h
>> index fa125db..d4d7f03 100644
>> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
>> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
>> @@ -251,6 +251,7 @@
>>  #define SCU3C           0x3C /* System Reset Control/Status Register */
>>  #define SCU48           0x48 /* MAC Interface Clock Delay Setting */
>>  #define HW_STRAP1       0x70 /* AST2400 strapping is 33 bits, is split =
*/
>> +#define HW_REVISION_ID  0x7C /* Silicon revision ID register */
>>  #define SCU80           0x80 /* Multi-function Pin Control #1 */
>>  #define SCU84           0x84 /* Multi-function Pin Control #2 */
>>  #define SCU88           0x88 /* Multi-function Pin Control #3 */
