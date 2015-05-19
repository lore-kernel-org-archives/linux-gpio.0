From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/3] irqchip: GIC: Add support for irq_{get,set}_irqchip_state
Date: Tue, 19 May 2015 17:01:16 +0200
Message-ID: <CACRpkdaJqr87B8FTEcw93Q=oELvFJ77w=Me-Wo5SwLD8R655_w@mail.gmail.com>
References: <1426676484-21812-1-git-send-email-marc.zyngier@arm.com>
	<1426676484-21812-3-git-send-email-marc.zyngier@arm.com>
	<CAL85gmBrkonMcKdUVGmYx6zT3wSe-e2jPhnL_+Tkf3s4jsAiWg@mail.gmail.com>
	<CACRpkdYffHJEzksc5mg7JZdwTzShGaQofAmbmn65=_V3ot04Rg@mail.gmail.com>
	<CAL85gmC4ovR99wQQYoKs=oo24So80jZ_guxDDFhi-1MXXj0uSw@mail.gmail.com>
	<CACRpkdZkBLrhFpZiYk4fiM3ND+UwnVJhNKs=+rL5iZY4fS7zCg@mail.gmail.com>
	<CAL85gmD=12u87vDAc601T=ZOgcS-jDo_=LaC5gRAZUHgp_iTbA@mail.gmail.com>
	<CACRpkdYV1MzjW6ZMvmOhqi0qhXeeQnC62--7WBY=_hZBT8cvXg@mail.gmail.com>
	<20150519110131.522f9c16@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150519110131.522f9c16@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Feng Kan <fkan@apm.com>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, Phong Vo <pvo@apm.com>, Tin Huynh <tnhuynh@apm.com>, Y Vo <yvo@apm.com>, Thomas Gleixner <tglx@linutronix.de>, Toan Le <toanle@apm.com>, Bjorn Andersson <bjorn@kryo.se>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 19, 2015 at 12:01 PM, Marc Zyngier <marc.zyngier@arm.com> wrote:

> If reading the pending state doesn't work, then I'd like to know
> exactly *why*. Only then we can add support for LINE_LEVEL using SPISR
> (which has to be GIC-400 specific, as it is not architected).

That's a good point. Is it one of these usual cases of hardware
thrown over the wall and the HW engineer mostly yawning or
rolling his eyes if we ask things like this?

Or is there someone who can actually answer the call?

Yours,
Linus Walleij
