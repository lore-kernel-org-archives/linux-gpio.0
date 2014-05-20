From: "Zhu, Lejun" <lejun.zhu@linux.intel.com>
Subject: Re: [PATCH] gpio: Add support for Intel SoC PMIC (Crystal Cove)
Date: Tue, 20 May 2014 17:15:49 +0800
Message-ID: <537B1D45.40705@linux.intel.com>
References: <1400082247-24168-1-git-send-email-lejun.zhu@linux.intel.com> <20140519103933.GK2067@lahna.fi.intel.com> <20140520083046.GD1651@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140520083046.GD1651@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bin.yang@intel.com
List-Id: linux-gpio@vger.kernel.org



On 5/20/2014 4:30 PM, Mika Westerberg wrote:
> On Mon, May 19, 2014 at 01:39:33PM +0300, Mika Westerberg wrote:
>> On Wed, May 14, 2014 at 11:44:07PM +0800, Zhu, Lejun wrote:
>>> Devices based on Intel SoC products such as Baytrail have a Power
>>> Management IC. In the PMIC there are subsystems for voltage regulation,
>>> A/D conversion, GPIO and PWMs. The PMIC in Baytrail-T platform is called
>>> Crystal Cove.
>>>
>>> This patch adds support for the GPIO function in Crystal Cove.
>>
>> I have few comments as well in addition to comments from Linus and
>> Alexandre.
> 
> One more thing, I just remembered. The crystal cove GPIO driver is
> supposed to provide ACPI Operation Regions to the ASL code so you need
> to make sure you have ACPI handle associated with the device before you
> register your driver to the GPIO core.
> 

ACPI OpRegions is still under work, and will be submitted separately.
I'll fix the rest in v2. Thank you.

Best Regards
Lejun
