From: "Zhu, Lejun" <lejun.zhu@linux.intel.com>
Subject: Re: [PATCH v4] gpio: Add support for Intel SoC PMIC (Crystal Cove)
Date: Tue, 27 May 2014 14:22:02 +0800
Message-ID: <53842F0A.604@linux.intel.com>
References: <1400810423-14067-1-git-send-email-lejun.zhu@linux.intel.com> <CAAVeFu+F=nHDCpL6Vfmq26QNr74mfRD5p9at_osB3R97v7xBSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAVeFu+F=nHDCpL6Vfmq26QNr74mfRD5p9at_osB3R97v7xBSA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, jacob.jun.pan@linux.intel.com, bin.yang@intel.com
List-Id: linux-gpio@vger.kernel.org



On 5/27/2014 1:38 PM, Alexandre Courbot wrote:
> On Fri, May 23, 2014 at 11:00 AM, Zhu, Lejun <lejun.zhu@linux.intel.com> wrote:
>> +static void crystalcove_update_irq_type(int gpio, int type)
>> +{
>> +       u8 ctli = GPIO_TO_CTL(gpio, I);
>> +
>> +       type &= IRQ_TYPE_EDGE_BOTH;
>> +       intel_soc_pmic_clearb(ctli, CTLI_INTCNT_BE);
>> +
>> +       if (type == IRQ_TYPE_EDGE_BOTH)
>> +               intel_soc_pmic_setb(ctli, CTLI_INTCNT_BE);
>> +       else if (type == IRQ_TYPE_EDGE_RISING)
>> +               intel_soc_pmic_setb(ctli, CTLI_INTCNT_PE);
>> +       else if (type & IRQ_TYPE_EDGE_FALLING)
>> +               intel_soc_pmic_setb(ctli, CTLI_INTCNT_NE);
> 
> Maybe a switch would be nicer here to choose the right value? And a
> single call to intel_soc_pmic_setb() after the value is picked.

Thank you. I will fix this in the next version.

Best Regards
Lejun
