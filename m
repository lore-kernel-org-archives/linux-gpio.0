From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH] pinctrl: mediatek: Implement pictrl irq wake handler
Date: Tue, 11 Aug 2015 15:50:47 +0800
Message-ID: <CAGS+omA+yhcSSMPq_Pvc+v9UjwLz8wJNKr9ezcuxnYHAUwNXfQ@mail.gmail.com>
References: <1438162601-448-1-git-send-email-maoguang.meng@mediatek.com>
 <CACRpkdZ1RjjSh5J=K724CpbXDXwdHJSdXOTLS8fSOO-34zn=9A@mail.gmail.com> <1439257910.38706.1.camel@mussux00.eus.mediatek.inc>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439257910.38706.1.camel@mussux00.eus.mediatek.inc>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, maoguang meng <maoguang.meng@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 11, 2015 at 9:51 AM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:
> On Mon, 2015-08-10 at 14:43 +0200, Linus Walleij wrote:
>> On Wed, Jul 29, 2015 at 11:36 AM,  <maoguang.meng@mediatek.com> wrote:
>>
>> > From: Maoguang Meng <maoguang.meng@mediatek.com>
>> >
>> > This patch implement irq_set_wake for suspend resume.
>> >
>> > Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
>>
>> Hongzhou/Yingjoe: are you OK with this patch? Can I have your ACKs?
>>
>> Yours,
>> Linus Walleij
>
> Hi Linus,
>
> Yes, you can. Thank you.
>
> Acked-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

NAK.

maoguang removes almost all of this patch in what I think is v2 of
this same patch:
https://patchwork.kernel.org/patch/6967441/

maoguang, please squash the two version of this patch together, and
upload a separate, correct patch.

-Dan

>
> Hongzhou
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
