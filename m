From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH] pinctrl: when claiming hog, skip maps not served by same
 device
Date: Fri, 12 May 2017 11:19:16 +0300
Message-ID: <df9e82c4-10ef-55c2-abc9-de315dee73da@cogentembedded.com>
References: <20170511200211.20985-1-nikita.yoush@cogentembedded.com>
 <20170511214444.GB3489@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170511214444.GB3489@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jon Hunter <jonathanh@nvidia.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Healy <Chris.Healy@zii.aero>, Jeff.White@zii.aero
List-Id: linux-gpio@vger.kernel.org

>> +		/*
>> +		 * If pctldev is not null, we are claiming hog for it,
>> +		 * that means, setting that is served by pctldev by itself.
>> +		 *
>> +		 * Thus we must skip map that is for this device but is served
>> +		 * by other device.
>> +		 */
>> +		if (pctldev &&
>> +		    strcmp(dev_name(pctldev->dev), map->ctrl_dev_name))
>> +			continue;
>>  
>>  		ret = add_setting(p, pctldev, map);
>>  		/*
>> -- 
> 
> Maybe add a comment saying pctldev is NULL in the regular case
> and only exists in the hog case?

Isn't comment above saying exactly that?
