Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBB245DF4B
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250966; cv=none; b=XmrbpL2NlwS+e7wpbDn8d2+YtmEmLd+66C92TeO6DOrPvEGv8LWJgZQoKVFbKjFB4l/sfUzhWn0jhfrbW4Wt98eowCJz9BUFdMNg5gYdpEmQwU5NWeoHPd9t1PjUaDFXPwjpGHktKGgq+1xQFXqijHYsiWVWViUNJnrNH5lMS2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250966; c=relaxed/simple;
	bh=ceGz+/JSzikXUw/9wJimnGn4R70MAZ9jq4KEN5hCYJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NeFLj9YKZ5E526PCgoqX8REwEc/HTnVjuSKPt3ukqn/DnJ260P2/aPcbFXdlgW0PKHN+mzeRWOQvnx5pYWCMrRnYSIoSvLHDVESHRDgwIzpSiS7D7ohazbHs8ZiBrkRYhxuBHj0iWCFi4CZ3CxyOUrCDJ44t24INOCS9a3rbE1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=TOaukOZv; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="TOaukOZv"
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 589B73F677
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 15:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1785250961;
	bh=/qUIIiNCkSh3g2ZufG12eN/sApuRNfi0iscRqao1qCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=TOaukOZvn9i+STT05qyHV3z8nySpdh0cyiuNDWZcOnFoCM/UknbLV1swkKTHI89Iw
	 LFGYBd9AoI6CLuljDq1n9d0Ir/QMKCmSP6JpYXfoFZRvuVuEJ6NG2MNcXpfwU44TnS
	 aJHveu9Ivm22tiTN6NaqVRCoPSNxymDWCtKtgtdhlXNe8hJXy2J7NcZR6KLDWFc6tP
	 HfEyNFBq4PSbhD4b0GT1zAOAjD45hr4LLH1CXKKo+RJpueirH0wkuwRus4jSJMFQpR
	 eQoWYDOEs97fcLQPCisVJabv6seefrvU9KPdR3VLrlBbD2zTNXyzYJaUlQ5DIA2Otz
	 7ZYtqY0waH5xTbDTkNUFlv0Q98nYzzZfy/SEAAAAdFZOVrQg/dhQXduPkzazaKlBe9
	 BdZzgmua3qd0D9Gu4OXIPF5sbJZz85l0f8MBYEEW7MxCDi53UtcEytvB7afII70yc9
	 ysmoUz+GnmNhFbdx2j5QSOW7LjKmQT288UOup3why8qH5w93PF3jeqP0S0eItJL6Ts
	 q90h9tFQM1eEILlnd+e/4wfBtkvyW+geORg5OPsPEBKkeUmolp6bgejJYy0JjYm1d7
	 Wimk/f3DGFIKg1i4oyShzSgfmBXOFw3cFKqGX6e5nHbonOlPs9crdyezt3sJTHFz8R
	 4Zo147RC+ycDvfqrLb/Af9pA=
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f6e658363so2826488f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 08:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250961; x=1785855761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qUIIiNCkSh3g2ZufG12eN/sApuRNfi0iscRqao1qCw=;
        b=GWmCkI+Ib3mT1Zx8c5px6dT4iS0YDLqFMBORwhWiI7xXAJGlbQSyHcd4qREmRm5mpi
         UdzQTEFJVuleWc/ATHs4VKpfRKTpkaWzvPkKvMyEvfGjgFuOynLRRrxU0xQxy9xEtMYe
         6ZEcs/kJUO2O01F4MnA9n5i7ZJ7K2pHDhgZ4xoUfqpevVWfmsfpxqda6jtSlAXwD4K20
         /zKqfjIHtLJ15+BSAoAz5KUSXlERKnyx/BRpTCHbc0GMGS507F7AM4j3a07Deik8daaI
         mryigHuDTfdN6v+fi07lJ2Vv4F5ooN48BRAPBqrwp+rDUxcvhNxPlRvqWkJsqFEoaZAW
         wuhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9rx+MBKN5MUvxmYvOMhGEa8kAe/Fjut3B4W12iPUsOisOCBTEz/+eJ9FFQc+Z9rUPNr1JWM3Sc4PX@vger.kernel.org
X-Gm-Message-State: AOJu0YziNs36Wv9gBGDOdoEbxsnWthRDkFo3xiUxln0SEleqNKemo87M
	n5wZsJa1UYNuHkMIYXQNouPnRR8mm5v9eDrD9FA1FvtPl80FFSU7EARikq0/KZWluCr/5WMjcke
	onpckWuIu4fPJqTYUexRLOJluFAWvdG9MnILRF4AMYcjUM3yZXd7UkB9YTKMwREb31ckZBSWVHg
	uSxu0=
X-Gm-Gg: AR+sD13H6y3oJ/SH6GM66H733saf/Kmpb4c5wzKBiCCN1u0cdoOLPzppNzcvkklCBJ8
	wvS7JCmsjHb1Z4eHSSG+VKv9gtLrGZLZurxu6AE+eoYRaHXgAB4rZs6xEr+p8omsGKhleoeA9Sd
	hGmOOOBNpGvH/6xtyBYf6/m5oFSTCU9a3Mq38rtb9n9CLUnhG1c0GgnZb76dl7UO/QD5fOIHQAF
	nY+bO1+8aFyOLcmNnYv2ieNOuBycUx6IICUqPtylN23oohBw/6Z8/EB1ahLPzCMuStOkcHP9trf
	QVAcTam4jbuAQd1K9NMS5r3hCDyIBAG6T2N4duxbGjD5AvxvWSE8p1BAbzetKRQOWyvvS9/DClN
	9LiTHX/BFxo4=
X-Received: by 2002:a05:6000:2583:b0:47f:8fb6:c32e with SMTP id ffacd0b85a97d-47fb1edc07cmr3123018f8f.46.1785250960736;
        Tue, 28 Jul 2026 08:02:40 -0700 (PDT)
X-Received: by 2002:a05:6000:2583:b0:47f:8fb6:c32e with SMTP id ffacd0b85a97d-47fb1edc07cmr3122975f8f.46.1785250960302;
        Tue, 28 Jul 2026 08:02:40 -0700 (PDT)
Received: from [192.168.1.12] ([176.43.219.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a596sm57899813f8f.4.2026.07.28.08.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 08:02:39 -0700 (PDT)
Message-ID: <7f31351f-43ef-41f7-b30a-2a9a008d4f3d@canonical.com>
Date: Tue, 28 Jul 2026 18:02:38 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: fix use-after-free via
 debugfs trigger on unbind
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727231026.470146-1-cengiz.can@canonical.com>
 <amh6txid90mJjd62@shikoro>
Content-Language: en-US
From: Cengiz Can <cengiz.can@canonical.com>
In-Reply-To: <amh6txid90mJjd62@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/28/26 12:47, Wolfram Sang wrote:
> 
>>  	debugfs_create_file_unsafe("buf_size", 0600, priv->debug_dir, priv, &fops_buf_size);
>>  	debugfs_create_file_unsafe("capture", 0200, priv->debug_dir, priv, &fops_capture);
>> -	debugfs_create_file_unsafe("trigger", 0200, priv->debug_dir, priv, &fops_trigger);
>> +	debugfs_create_file("trigger", 0200, priv->debug_dir, priv, &fops_trigger);
> 
> What about removing the other _unsafe calls as well? TBH, I can't recall
> why I used them. Doesn't make sense from today's perspective.

I checked those too, but buf_size and capture are fine as they are. 

They use DEFINE_DEBUGFS_ATTRIBUTE(), whose read/write paths take a debugfs 
reference (debugfs_file_get()/put()) around the access. So they already 
hold a reference and removal waits for them.

Switching them to debugfs_create_file() would just add a second
get/put around the one they already do, so I would leave them. 

Happy to send a follow-up if you'd prefer them consistent.

Thanks!


