From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH] pinctrl: msm: Pass along set_wake failures
Date: Thu, 12 Jul 2018 14:04:32 -0600
Message-ID: <20180712200432.GA887@codeaurora.org>
References: <20180619234349.166190-1-evgreen@chromium.org>
 <20180709173022.GH2050@tuxbook-pro>
 <CAE=gft5+oOFv8y-XCtiQ8mc7gQ1FFSK0+bPk=mJu--ovLfDDJg@mail.gmail.com>
 <20180710203805.GA14825@codeaurora.org>
 <CAE=gft7RURCr0Lj8qO+i5EjwD25xkdqS+UB5RC_02-7FLdM1fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAE=gft7RURCr0Lj8qO+i5EjwD25xkdqS+UB5RC_02-7FLdM1fg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, swboyd@chromium.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Jul 12 2018 at 10:31 -0600, Evan Green wrote:
>On Tue, Jul 10, 2018 at 1:38 PM Lina Iyer <ilina@codeaurora.org> wrote:
>>
>> On Tue, Jul 10 2018 at 12:53 -0600, Evan Green wrote:
>> >On Mon, Jul 9, 2018 at 10:27 AM Bjorn Andersson
>> ><bjorn.andersson@linaro.org> wrote:
>> >Our understanding is the downstream kernel had an interrupt hierarchy
>> >of GIC > PDC > TLMM & everybody else. In the downstream world PDC
>> >acted transparently, forwarding most requests directly onto the GIC,
>> >but quietly handling wake interrupts as well. With the upstream PDC
>> >driver, the #interrupt-cells got changed to 2, and it seemed like
>> >folks didn't like the idea that PDC was acting transparently. Correct
>> >me if I'm wrong there. So now we're sort of unsure about how to wire
>> >in PDC. If we make everybody an interrupt child of PDC, then we lose
>> >the ability to specify the third GIC parameter, and we're stuck
>> >expressing interrupts with respect to PDC pins, which is an awkward
>> >mental translation.
>> Its an unfortunate side effect of the design. Drivers will have to
>> request the PDC pin for wakeup IRQs.
>
>Would they use the PDC pin to request their regular interrupt, and the
>PDC would turn around and ask the GIC for them, and also enable the
>wakeup interrupt?>
Yes, drivers would need to request a PDC pin since using the
interrupts-extended format and then enable that interrupt was a wakeup
interrupt.

> Or would devices have some sort of separate entry for wakeup
> interrupts?
Not sure how you mean. If it's the DT you are asking, then yes, they
would need to have a separate entry in DT.

	wake-device {
        	interrupts-extended = <&pdc 2 IRQ_TYPE_LEVEL_HIGH>;
	};

See Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt

Thanks,
Lina
