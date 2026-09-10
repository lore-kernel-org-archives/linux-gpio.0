Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387D549F13A
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052852; cv=none; b=j0ToOXh5YBL+1PMX6xLetN+pL7I+9LqHWjPW0Gqc7SwZUUK0EmSI7+V83pyr7EWVqNmDVm5/tJ/48U6/8RkWgT0UN9z+tyWGlAiL1FX+UpPt4KOVGTf5IKUPqFgmuG7YOKPnwY+r0+24Z96EL5TRxyl36lVfOAdNVURfyjqeByA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052852; c=relaxed/simple;
	bh=ZSifJhowUN3XRl0pBXqUuN4VFkNb9eYBeJKIvQ+HjAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Av4te7vRUXaWgswc4ZSZNvGCYXhtwNZHFnJrWDAJaV4Ft0N0T2KEoO3tvx5wHjUCrZ3YBXNqQI9YGT5NXl9Xmc6S6PyPbp5envsJp/RM5x1dOq7QPTyc9ZsKS8bB2138bdhB4keQ9M7LwxyznGaveu2s4hog5bYbv3pMW+7qbN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sMJFVTEG; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMJFVTEG"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4c0cd10d56fso641618b6e.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 08:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789052843; x=1789657643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V24IRBj7QNWWWRl5+75adnJliei49Y/3P3TGo3Uu6OY=;
        b=sMJFVTEGiqwD4HN2lnLSjGGf+YwfM/2/VZfybsmGjrey4gRuuWq7iX05gIuZcBq68z
         rwshWr4T550jnl0AaMhr7+Th5xRh4b9GxltiHqFp/K3OQfhN42RLntJnfJyE8aKnVW9p
         XRvZL+47sE+sAJHiwVyNZfZbZdmLfM08nbgwbEdOoqyDW46XO0+ro9Ekez/HipDi0Xn7
         QyL1mEMu9VSli+VnYzcqLzbXRd+WogdDKB5+f/Iw443EmUVqrEmAmJvwuQcxKf/kDCpl
         s2eJeHLR6fEqozh1WwBtmmMYO/P3eljCplJpcwuSrynY5rJiVyH+VknpsUR541EIDrKO
         Evtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052843; x=1789657643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V24IRBj7QNWWWRl5+75adnJliei49Y/3P3TGo3Uu6OY=;
        b=RKKmPAO9UZAu5O2NsS1KwBQaYQqe2+ZtEj2XMeMvF+ma32PXiG2luxmByFbWncVcn4
         4lBJnRs38rpsXxoz/PkDCari2F5zCFSGUOsolN9HPFJj8O2E0Rg7jkTKBBz+1d+ebtgx
         FLCUnf1HUMq8e3IUP9TRRxEsf1HcCeCKKxh3jxsdreBCbef2cr92dQv6NfKxPB88ic4S
         C5elwibbi0J1oGqwwhOt/5y77Wje/0ewEcHtzaexoJcMDbqaBoU2S+UGTe6N65mdZQbB
         KwkhCKvF8oMbm84n535DLzhWzakIzF7+oXBRLuKaxLV8u8qNEO3dr+lN3EGfasE6dPgY
         DnLw==
X-Forwarded-Encrypted: i=1; AKwUvBx3w+xzqgM2QV2vGzebC4clu1v8nAagfXEYEvt5wyCMOo1VwJgXmrn8vJxU9N1pZRCxKdKIjV9KPloy@vger.kernel.org
X-Gm-Message-State: AFuF++l0wdA+rHljKLLcZSll+9tQsGTaVKrwxpXejM41p9czz/vba9ZS
	eiwiHfk8A0m1UbBEIaH3xNHyTYXyw64KyCOnfyC+9zY7hhFMZeOwrhxX
X-Gm-Gg: AYBFou1szwxwPCAZft3xI53UgSR5o+n7LbNS1x1fzgkC7DUNGojt52lGAvxShORjMZP
	b3oERNkFQbZp+PJNJdKhVt7ZQFYuFyLvQWTrL2JRSLzhKB8bY9RNrICZSQraVkHofmgNquPIkZE
	lex9iqP1xOFqVmeY7SmSayX6LIf2t46vAWiBG4PUdDum12u7eahfVrhEkgonU849+nz2yU0Cd+r
	tCjLIRz8VO/lwBHv+3HyIYv81G7pdvPQhQ9VPKsQPFLZXWObNiqlkK4LLNRZWVw4vs2FB3dZMXK
	QfYflL9iHm9cOISsxXyP6nuyMeP6m/7a2eROYbxvGXynpnceEy8XGnQ5VXiK/xAZKzBpH5L2rJz
	iE56m4InSoMyXFYxR27Sl0CGoR0P9P6w1rbtIfGstzDciw2m5oKtw1sYfQLWZSM/pXCeDqjwfuh
	R9S7+q1yR132ZG5Fcc30qORmBoBI0TglkGKnmdMQQKYFQjgyoqq3ZFyT4yHvQXnl/r2JzpM8xO0
	3kH0wOAmuRZ/IxS0BwaPjlhDOdWJGncv1RG7a1MsJiXoWrIkbvUwJxdU4bUJ1qHtfyUexrpkdM=
X-Received: by 2002:a05:6808:1a05:b0:4b2:8d83:436e with SMTP id 5614622812f47-4c1a5f9e194mr2665075b6e.8.1789052842906;
        Thu, 10 Sep 2026 08:07:22 -0700 (PDT)
Received: from [172.24.138.145] (ipservice-092-208-240-035.092.208.pools.vodafone-ip.de. [92.208.240.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d200fesm18169918b6e.3.2026.09.10.08.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 08:07:22 -0700 (PDT)
Message-ID: <d597d432-2903-4f0c-883e-eccb6867bc8d@gmail.com>
Date: Thu, 10 Sep 2026 17:07:12 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] gpio: ad7768: Add AD7768 GPIO auxiliary driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
References: <20260908-ad7768-gpio-v7-0-52ee6ef18a1e@analog.com>
 <20260908-ad7768-gpio-v7-3-52ee6ef18a1e@analog.com>
 <ap_nqnPLWJpz5N8o@ashevche-desk.local>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <ap_nqnPLWJpz5N8o@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/8/26 12:47, Andy Shevchenko wrote:
> On Tue, Sep 08, 2026 at 09:24:54AM +0200, Janani Sunil wrote:
>> The AD7768 provides five GPIOs controlled through registers shared
>> with the parent IIO device. Register an auxiliary gpio-regmap driver
>> and use the parent device for runtime PM.
>>
>> The device has separate input-state and output-latch registers. Add a
>> reg_mask_xlate() callback that checks the line direction and reads the
>> programmed output latch for output lines while retaining input-state
>> reads for input lines.
> ...
>
>> +	if (ngpios > AD7768_FILTER_GPIO &&
>> +	    device_property_match_string(gc->parent->parent, "clock-names",
>> +					 "mclk") < 0)
> Looking at the length of the line I have just noticed that this uses
> gc->parent->parent. Here is the question: what does gc->fwnode refer to?
>
gc->fwnode is currently null. Would you prefer that I explicitly set config.fwnode = dev_fwnode(parent) and use the fwnode_property_match_string() here instead of walking gc->parent->parent?

Best Regards,
Jan

