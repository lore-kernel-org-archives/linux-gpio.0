Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192624;
	b=Xry3AT0zoIH9EJw6IMOw6m8jyp4VqV2/A7XB8H4rWRnSOx2UDConZ1YOVQw/dvTE2Tgl
	 vdnkJbFWcXEFeiSFuXB1lZwGZmW3imA05sjF3/RuYUEjxPj5cMLGHh9XPyrxtpgwvFzio
	 e4qZ/7dHIw+n05MONTYQyYfXPeUMKcYv7xhESrhAosH7IRdK//i6jO1W3mGEzWvJDbMXw
	 xImIsTkjikh4vG4tiM6oYvGCbMo7Yjcq1DTY+bLfshLheGMmO+k4dkrST2JxGDG5T646S
	 iEse76rLnNpWaAHVGeVpdXEVndZ8mJ+r0jRhiC9VQAzb8ncUWUssjNPIl2xyRL2iPQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192624;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=TgSvuOCz1yzqmQTBxIlw5PsX+cc1UxOx06GfU8k+6sQ=;
	b=oeKH8hJouxvS/L8vPFbiiVyd1ho7Qst7/lu1QSsOTM+FCCJmjZXl9BtPL8d10MOG+8CV
	 qX6gvOg7k3I8dTlxxHbHwGYCJ6SHICJoY0qPPeNqyJO/fN8OSRDtpyCLTE6PjzNeGlSg0
	 BUz7u7EWpjwm7yYfIdJCNLuGF0/WiqVpeVUnq5bfoH7NPEHV0UVnzpHzlIMFebd026QUm
	 sL5xOROCX6lDlwhXWqHDLXQwlmHHDjmlPEXwJUy3kr0BbBaNnTOAep1sn27y6ukCjPBRO
	 u8joHte00/6WY6JQP6HxuyJ0rcGvyGg9FcfgkyG2RCmlToIwrRyd0tnJjcDl6cjU3vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=f7zVJPYL;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912FE606A31C;
	Mon,  9 Nov 2026 02:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 912FE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=f7zVJPYL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794192621;
	bh=TgSvuOCz1yzqmQTBxIlw5PsX+cc1UxOx06GfU8k+6sQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=f7zVJPYL6RCaoVmAll7Ub1ogTo3eKSo91d9qzir4wCFe8e4Ye1g/9UpaKwACHuoYl
	 faLkyRQsHCbqSMTu9v6M+WZXBt2j+Pq4jZdmAWjWlnwIZNArKa+3T6XKgAZp8GZIZ5
	 zgNuJsAglH3MH2k9jUtcXucof3VTa3H5bYDLBstZehQfZaDz9y5JMNKbXLMDmkR+NZ
	 MrZ6xPEHk3gCtIc/PCNG4RLTFcmPM943y7eRLeFTl8Xzwg8sBcCEbQNsPi6frLzOhE
	 xXcQx7JAWLUFTTy6h4aDXZcN2JXpoAQWtvj0dNTrgTchVZrSTxd9QzSTbDA+JP5o2A
	 r7UvTkQwu8prw==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1DE1064952;
	Mon,  9 Nov 2026 10:50:21 +0800 (AWST)
Message-ID: <14d76dd026f6d1077a6ac388a6a2d6136654c58e.camel@codeconstruct.com.au>
Subject: Re: [PATCH] pinctrl: aspeed: Use managed pinctrl registration
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>, 
	linusw@kernel.org
Cc: joel@jms.id.au, ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 09 Nov 2026 13:20:20 +1030
In-Reply-To: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
References: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, 2026-11-07 at 06:52 +0530, Prasanth Kumar Padarthi wrote:
> The shared Aspeed probe helper registers its controller with
> pinctrl_register(), but does not unregister it on device unbind.
> The registration can therefore outlive device-managed data.
>=20
> Use devm_pinctrl_register() to ensure the controller is unregistered
> during device teardown.
>=20
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
