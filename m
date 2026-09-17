Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5430B523798;
	Thu, 17 Sep 2026 13:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651602; cv=none; b=uGwHaHZqdUxNQoL7kabRTGJBYai+TYk5lWwMTE/eVix9uF7NKpDBoRqpcyzVhvghEZ1emVJpHt/HFBT4dsqTIb73r8YqWPHRCs1ZsinNK4eCW0bVQ8GPnSCZuG2WF1qk065gpTOo/XgiVmopVJKWIxTfOfksZUOAjkpaW5mYVCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651602; c=relaxed/simple;
	bh=PGIgIE4wTCTWIbQZRWt+QuBxf9eusAIAlFk67LHWHjA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Ld2Vd/COuQAn+bY5R4KF8vosSyJCnODoyH2iypR0vCDow1MrM53eooaSlNEy3GO9shee9j4AVy2hQQb2TgEqEpYTxxBuzahshRUsab/U8g1ZlWH6igAxAyqU5LSujvwOFOH+AZhjoq1Onu8+YveJMOZgmyDeHdY8mzjnEbx5jYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=hcO9jXlm; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="hcO9jXlm"
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id A4B19606C9;
	Thu, 17 Sep 2026 13:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1789651250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2EwFQkqyBiAApy771fwJy2rsJy2A9762vPkKowyaH3A=;
	b=hcO9jXlmmO1lV8DEnWGD4PDkdgWvS55qx6pga8RsLmEoCUYej2uKkuqaHky7RWtj+mWdQG
	h9JMM7849Fxh/QPHJAOt2ZEFnuGxxRo0xpubOIKGTZ7RrXafnEtsGzdFMT7zLse5C5TQ6W
	c+lE+AAfap9oeVZSTNBIv0fyGHbjttU=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 1D1F4401E4;
	Thu, 17 Sep 2026 13:20:50 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 17 Sep 2026 15:20:49 +0200
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
 <brgl@kernel.org>, Frank Wunderlich <frank-w@public-files.de>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, frank.wunderlich@linux.dev
Subject: Re: [PATCH] gpiolib: use of_node_name if line-name is missing
In-Reply-To: <aqvkU_1_ki5lGXS_@ashevche-desk.local>
References: <20260917122815.88601-1-linux@fw-web.de>
 <aqvkU_1_ki5lGXS_@ashevche-desk.local>
Message-ID: <85b0d147af3b63a6b2419b7daaf81332@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: f3537e52-0881-484c-bcba-f3ad08769ce3

Am 2026-09-17 15:00, schrieb Andy Shevchenko:
> On Thu, Sep 17, 2026 at 02:28:13PM +0200, Frank Wunderlich wrote:
> 
>> Until v7.0, GPIO hogs inherited the DT node name when no line-name
>> property was specified. This was implemented as a fallback in
>> of_parse_own_gpio().
>> 
>> Commit d1d564ec4992 ("gpio: move hogs into GPIO core") moved hog 
>> parsing
>> into the GPIO core and removed this fallback.
>> 
>> Consequently, GPIO hogs without a line-name property are now displayed
>> with a ? in /sys/kernel/debug/gpio. Restore the old fallback.
> 
> ...
> 
>> int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle 
>> *fwnode)
> 
>>  	fwnode_property_read_string(fwnode, "line-name", &name);
>> 
>> +	if (!name && is_of_node(fwnode))
>> +		name = to_of_node(fwnode)->name;
> 
> Can we move it inside the loop? Yes, I understand that it will be 
> unnecessarily
> called more times than required, but gpiod_hog() is called anyway in 
> the loop,
> so I don't think it will be a big deal. With that it will allow to 
> group
> OF-specific code in one location.
> 
>>  	for (unsigned int i = 0; i < num_hogs; i++) {
>>  		if (is_of_node(fwnode)) {
> 
> 		...somewhere inside this conditional...
> 
>>  			/*

I'm not sure what you want to achieve here (maybe only to have the 
is_of_node-condition once?, as the loop imho is only for enumerating 
multiple gpio (like "gpios = <3 0>, <4 0>;") inside one hog of_node. 
Here the node-name will never change (like the line-name above) and 
read-once is correct.
But while looking at the code i also thought about these multi-gpio-hogs 
(label and output-X). Imho here something like the gpio-controllers 
"line-names" would make sense as well as something similar for the 
output (or just handling this with the GPIO_ACTIVE_HIGH/LOW param).

But if you think the part should be moved into the loop, that's no big 
deal.

regards Frank
