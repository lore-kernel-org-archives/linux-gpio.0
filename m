From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 4/8] gpio: zynq: Provided workaround for GPIO
Date: Mon, 14 Aug 2017 16:01:24 +0200
Message-ID: <6ff1ce3b-1051-d125-c044-a5b3ad5aa2fd@xilinx.com>
References: <cover.1502103715.git.michal.simek@xilinx.com>
 <4f1f7ed79879d17e38ffda095d631d0f561c2818.1502103715.git.michal.simek@xilinx.com>
 <CACRpkdaM7TN8pg=E6ETJrZYfN8AC-CNY8CWJrWUrsX=EP+gnRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn3nam01on0076.outbound.protection.outlook.com ([104.47.33.76]:37182
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751428AbdHNOBm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Aug 2017 10:01:42 -0400
In-Reply-To: <CACRpkdaM7TN8pg=E6ETJrZYfN8AC-CNY8CWJrWUrsX=EP+gnRg@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, Swapna Manupati <swapna.manupati@xilinx.com>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, Josh Cartwright <josh.cartwright@ni.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 14.8.2017 15:57, Linus Walleij wrote:
> On Mon, Aug 7, 2017 at 1:01 PM, Michal Simek <michal.simek@xilinx.com> wrote:
> 
>> From: Swapna Manupati <swapna.manupati@xilinx.com>
>>
>> This patch provides workaround in the gpio driver
>> for Zynq and ZynqMP Platforms by reading pin value
>> of EMIO banks through DATA register as it was unable
>> to read the value of it from DATA_RO register.
>>
>> Signed-off-by: Swapna Manupati <swapnam@xilinx.com>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> 
> Patch applied.
> 
> (I hope my random application of patches does not screw things
> up, then I guess I need to back some out.)

Should be fine.

Thanks,
Michal

