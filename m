Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A430415F09
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 08:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065372; cv=none; b=Q6ceWGzrwGc+8Mgo4S6Xv124c0Jpeqm5NOga/bkVOVI8CYEWtlmw2jOeyKm4/t/tesQOJ3hgJa3bIWvR1eCZCUjw54+2Z+4aV6P2RJLoNOvVnOBVYl5C2r72/7imYoGdCmhbKjuVdxJrVlCUE0ZM1q8bzJkwfZNfSgSj9uncZGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065372; c=relaxed/simple;
	bh=rDoQb5mlFA5Th7ISk5na7ZXgI3XPc9PQbmWOFr3EV4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YiFcQFQPivGoIMbVSjstERumNOYRkJU0B+QWRHZMV0TG5FtKt0s+PM4Q4jx3xb7N8Ea6Q/SPBFLSGh9ZvrPpIMrrnp9yftpNKTquO/PCtzprMv7Hzjmytx+A+bzlQdLsv1YZkJ5mt1Gh4eCCB35NbLp0ydCoJpsL9Ge8OEVooGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=PJl9nyo0; arc=none smtp.client-ip=62.149.156.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="PJl9nyo0"
Received: from [172.18.100.99] ([109.238.20.116])
	by Aruba SMTP with ESMTPSA
	id 8vm3xQopKbk7m8vm3xvA4e; Tue, 22 Sep 2026 10:22:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1790065368; bh=rDoQb5mlFA5Th7ISk5na7ZXgI3XPc9PQbmWOFr3EV4U=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=PJl9nyo0hkbuQaiZO9eNEwo0urQLcIqMblxFo+70Xq9y+AjK5+jskDd3OArA2bsm9
	 OfmtUJs+QgP2I64shyPrF+19LvPlsOkWlQwVV2pvkNh0VsU0NIAbzWkTVaj2SI5xnn
	 2g4tZWxKO3L+D/7kIBQ6BDSjvt4RN2LdUz+nGN3EXlr3SqIqEKWGyRRcyUCqJNAis8
	 dMFAV45SYBoQhHLPtu+6k2xa/G6nn25A3Fb1/eFhNNgQPDxMHJVotqpAvOhGB4LTt7
	 bqwk/CJChfD03roC0fluQ8AIbddNZyEHa1jGXxwFn6XWM0Av7eGj5F6tY2zeh/lCNb
	 gVTvnDMdYfO0Q==
Message-ID: <235b34e3-2eee-4904-9cdb-490859dabda7@enneenne.com>
Date: Tue, 22 Sep 2026 10:22:47 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] pps: clients: gpio: propagate probe error codes
Content-Language: en-US
To: "Farber, Eliav" <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260917075611.47881-1-farbere@amazon.com>
 <20260919171157.5502-2-farbere@amazon.com>
 <9eb4bd5c-39f5-4236-a0e0-3c3679bf7f8c@enneenne.com>
 <BY3PR18MB4722454B7A78A0E47345EBE8C6832@BY3PR18MB4722.namprd18.prod.outlook.com>
From: Rodolfo Giometti <giometti@enneenne.com>
Autocrypt: addr=rodolfo.giometti@gmail.com; keydata=
 xsDiBD32DGIRBACHuT9E2vYO4e90iO84KDuDpkz+qZeTwnEj9ncOrG+RN6ES/MIgLRxleLOf
 g5NDT+jIOZhLkZ/x+ylHvBYKFQUA2wIKqHvnsANOor07OTIaLRxMJOMWW4KqiLxmx663a19i
 e8p/yI7MNyJlbNXiUTP9CtG0H0PwscY8D28LyRDd1wCg5egtPUxNUr/SKQKm1c1rUdaGqrUD
 /1sko9jCG6/cv1zNaT1Us3XEhuHGvcd/p6iotWZM2TZE/u4YMNcasxCxtgKHwIvuSFnBxAQ5
 I+gkU5g3GuvfnoZeW2wFlNz4TuuoEup/n1XGhMR2XebXHSVJcViaSLJ+506VEs0IDJ7+bEAS
 orTGmqmihOEQOtYcHqmAGFpqWNmWA/9gtrJdf2lcaLdoUExyyjUPTpiO69d9Y39Zmw8vGfU5
 VkmolrcJzeGyjNnCZj1XaGvJ0tKswsWl0Ux6rzUiVa1DUkYOwAk6ZMVzmS/mnhAnp5fi/A0b
 I2XOWogsDfsgBa6kg6GLNQChNcJK3IWHKEN7S250e2se6LazGEktrLHzCs0tUm9kb2xmbyBH
 aW9tZXR0aSA8cm9kb2xmby5naW9tZXR0aUBnbWFpbC5jb20+wngEExECADgWIQQffKHRJdpn
 mkhrSRZBpMJg0lpWMwUCXH92WAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRBBpMJg
 0lpWM+9RAJ91Nqq3vAnawtPncHn5G4Y2svLGDQCgzc5mI0/M9U3PSUrMsOCIKHxlgEXOwU0E
 QRVYPhAIAIvbMQcLOsyqWDJtBJuTlePpBggbNEqXAxIJdK9X/Kqd+RnfSQECoy2NBSerD1VK
 pbpHBjJaxe0maP2qOrt7/dqAg+FL1FL5nrAc/x6hnOeG7LdZL5HlkE2DxztevJpXaMfQ8dCI
 bCd5W8tunFqp7ay0Pqd9nyYrmiXIS7/Lz/6IE97Jia05JcyMJ7IzeYZIpfNV5q65Cge2jMQ6
 36wMcfv8cVinACpXs/rFuvpeTM85osJwfFmJCyxOsYCbakyQ2a+0lBSwil2ZLT7a8iRKMYR+
 eFetybV3xo2dSmNlHXUOhmUusBs1e1b2PFQpFrPaC67OsIq3nyzkhg9H4hnBv/MAAwUIAITx
 sUsmu1KJ5xAkqBWfxAOtCGKitihvYFB2jqo816Nh1nQGlcOiZWpZeH4u1ST5P+m2IDgufFnR
 vZR0oEpN+0+F87dQH3qp/HzpZgihjF5EF7LrthRw+fs7xLPn3H8hEteKDFUKyqEt6XfdO1Hz
 YuOKKpDZaMng3UNvjtHC2x6+3uCXShHN3tPJH5nkFysZZzvjJWhVUTYv5N/bzl/Bu8Y/DguI
 p1NlBT16CIOmrTwH6XruHWl5gLcrcqfDLR+UffaOiTq+ntE99QcHLTOJyGCGISHCH1EnZIbJ
 x48brfPPFG6gyEsXR0cHVnpr/Iw8I5lcXOVCtXCQafyN/EcKBb7CSQQYEQIACQUCQRVYPgIb
 DAAKCRBBpMJg0lpWM55gAJwLLFWMuChhhl8kqaCx9PqyW5pIGwCgzQuV7XvNUa+bErd/OQIB
 umszsNs=
In-Reply-To: <BY3PR18MB4722454B7A78A0E47345EBE8C6832@BY3PR18MB4722.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAa6Bsko+QdGN9bu0Wv/CXMde97K7wFy9dI5oE6wMHgekpO9MJGYFH1nk9eLT4/fiJp6ke1JMW/9EKxxkXtOilvROeUETWgSez3OC4cEdSlWyj0CxKJu
 FJByecSE0E6Ql997Wt3//vXXxIkvAuDVe3K2gSUNskzReS9hu13UbOXj3VIm/yCXgQu6dJKrf86R41LRgd6qyngxebMLeTK29f7N/7QRm5KpH1gzEbQFAPJZ
 Xib4yxVP94Jnjxr2faHlxqZJ5izHeJ+2Hw4zBnwAh5Q6v3UaPhk4ma5iZDdnH9xiTosbenQ0DMGsYsPhXPGXgBPGhul+L6oprFY0iMc+G83IGyXNMUd0HH+U
 Ne2ZK2OHPZ0FHVQNL0vAA0nuu5mmGDxR03JSpUrtuko1uY2qnk/xSu1s7WmXPhN4Kg158DXRG/z47hsIQp38+DrmLZvMxcU9lZGFZO7UNonGqjnUTZ63Fks5
 uIxHHX0P3wANeWPv7shtMGbbdfSElLaD8rPzzU50lXMSXfVn4R4u4EO0AW2TTaMG6j9Ddk5L2vFSU4CFP3m2JEAKFmeponhObilVXXh7JNEefsLabUyVFUpp
 Re7UK5O3aYGA1EBqTmMyQkX2

On Tue, Sep 22, 2026 at 08:08:09AM +0000, Farber, Eliav wrote:
> Agreed on silencing the deferral spam. I avoided return dev_err_probe()
> because patch 3 turns both returns into goto err_release_pins, and
> dev_err_probe()'s idiom is to return the error, not goto.

You don't have to return it.  Calling it just for the message and then
jumping is fine, and ret already carries the code the label needs:

	if (ret < 0) {
		dev_err_probe(dev, ret, "failed to map GPIO to IRQ\n");
		goto err_release_pins;
	}

But please don't open-code it: on the -EPROBE_DEFER branch it also
calls device_set_deferred_probe_reason(), so the hand-written version
silently drops the reason from /sys/kernel/debug/devices_deferred.

One more thing: dev_err_probe() already prints the code as %pe, so drop
the ": %d" from both messages -- data->irq of course stays in the second
one.

In this patch it can still be a plain

	return dev_err_probe(dev, ret, "failed to map GPIO to IRQ\n");

and patch 3 turns it into the goto form above.  Same for the request_irq
one.

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming

