From: tengfeif@codeaurora.org
Subject: Re: [PATCH] pinctrl: qcom: Clear status bit on irq_unmask
Date: Tue, 11 Jun 2019 18:41:26 +0800
Message-ID: <46b715974766d5c557685a1ab9131abe@codeaurora.org>
References: <1559285512-27784-1-git-send-email-tengfeif@codeaurora.org>
 <CACRpkdbdkbSofrvJ0hSV66DX+DcwWXp0ONDjx0265Pz50yE8TA@mail.gmail.com>
 <20190610145132.DD1132085A@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610145132.DD1132085A@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, MSM <linux-arm-msm@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 2019-06-10 22:51, Stephen Boyd wrote:
> Quoting Linus Walleij (2019-06-07 14:08:10)
>> On Fri, May 31, 2019 at 8:52 AM Tengfei Fan <tengfeif@codeaurora.org> 
>> wrote:
>> 
>> > The gpio interrupt status bit is getting set after the
>> > irq is disabled and causing an immediate interrupt after
>> > enablling the irq, so clear status bit on irq_unmask.
>> >
>> > Signed-off-by: Tengfei Fan <tengfeif@codeaurora.org>
>> 
>> This looks pretty serious, can one of the Qcom maintainers ACK
>> this?
>> 
>> Should it be sent to fixes and even stable?
>> 
>> Fixes: tag?
>> 
> 
> How is the interrupt status bit getting set after the irq is disabled?
> It looks like this is a level type interrupt? I thought that after
> commit b55326dc969e ("pinctrl: msm: Really mask level interrupts to
> prevent latching") this wouldn't be a problem. Am I wrong, or is qcom
> just clearing out patches on drivers and this is the last one that 
> needs
> to be upstreamed?

Your patch(commit b55326dc969e) can cover our issue, and my patch is no 
longer needed.
Your patch isn't included in our code, so I submitted this patch.
