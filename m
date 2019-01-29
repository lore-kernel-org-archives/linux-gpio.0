From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: Re: [PATCH RESEND 4/4] Pinctrl: Ingenic: Fix const declaration.
Date: Tue, 29 Jan 2019 12:06:02 +0800
Message-ID: <5C4FD12A.2050005@zoho.com>
References: <1548410393-6981-1-git-send-email-zhouyanjie@zoho.com>
 <1548410393-6981-5-git-send-email-zhouyanjie@zoho.com>
 <1548439157.1804.1@crapouillou.net>
 <c6de4935a2b3acdbcc9146af702322c58707c9f5.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c6de4935a2b3acdbcc9146af702322c58707c9f5.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>, Paul Cercueil <paul@crapouillou.net>
Cc: linus.walleij@linaro.org, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, paul.burton@mips.com, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com
List-Id: linux-gpio@vger.kernel.org

I would prefer to keep it. There are many other drivers that also use=20
this header file.

On 2019=E5=B9=B401=E6=9C=8829=E6=97=A5 03:22, Joe Perches wrote:
> On Fri, 2019-01-25 at 14:59 -0300, Paul Cercueil wrote:
>> On Fri, Jan 25, 2019 at 6:59 AM, Zhou Yanjie <zhouyanjie@zoho.com>
>> wrote:
>>> Warning is reported when checkpatch indicates that
>>> "static const char * array" should be changed to
>>> "static const char * const".
> []
>>> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
> []
>>> @@ -172,23 +172,25 @@ static const struct group_desc jz4740_groups[]
> []
>>> +static const char * const jz4740_mmc_groups[] =3D { "mmc-1bit",
>>> "mmc-4bit", };
>>>   static const struct function_desc jz4740_functions[] =3D {
>>>   =09{ "mmc", jz4740_mmc_groups, ARRAY_SIZE(jz4740_mmc_groups), },
>> With this patch applied I get this:
>>
>> drivers/pinctrl/pinctrl-ingenic.c:196:11: attention : initialization
>> discards
>> =E2=80=98const=E2=80=99 qualifier from pointer target type [-Wdiscarded-=
qualifiers]
>>    { "mmc", jz4740_mmc_groups, ARRAY_SIZE(jz4740_mmc_groups), },
>>             ^~~~~~~~~~~~~~~~~
> You could change group_names to const char * const group_names
> in pinmux.h
>
> ---
>   drivers/pinctrl/pinmux.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
> index 3319535c76cb..2b903774ba5c 100644
> --- a/drivers/pinctrl/pinmux.h
> +++ b/drivers/pinctrl/pinmux.h
> @@ -122,7 +122,7 @@ static inline void pinmux_init_device_debugfs(struct =
dentry *devroot,
>    */
>   struct function_desc {
>   =09const char *name;
> -=09const char **group_names;
> +=09const char * const *group_names;
>   =09int num_group_names;
>   =09void *data;
>   };
>
>
