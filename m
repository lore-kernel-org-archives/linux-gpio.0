Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795868205;
	b=l51+Bfa6+QsSME17X19BCo8p8/eZqp7YasnwhIfXoxtQrix4abxsqmw+Ok8y2IIpEk6p
	 ileITOsW9JOJkx1e7HIOpTkuYX2SfTH0eOIgJQ9kP4PAvFUr0g5Po4xjlefWpKG/4pqEj
	 Mn7qeKbko/weae/GdoNPIz/1pucQ0mM8CfeHAo7XskDmJBoO6bE5Ppg6JoE0GyK1/iRrd
	 6KUhowJs5l9OdtlsigBE1JnUL3XVLadw1FcsVwNmwVy8btrC0ucm+MXR4a8YLO8adksrW
	 1d6SDfds1Q9NkEgaMj4g+iW3LRUhVnohVTU1r+9/RyemfGHzXX/73OPlRBGc/5XmOOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795868205;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=/mLkm55c+F2jZS3KIKnFI5x7PvC0NJzUuMc7YJFVuok=;
	b=ovlig4aa7jPGcl4r6SPW9cyVM8h+MdB2FAV0620MQ1Xbft9TOo85tmK94g4wzDAiR6oW
	 W5Q7sY85uoM3bW+zF6uB7Zws/ZJfDjJq1i7vjVt9S9nme+Vn8+vLmVfS1n3kuA40AIW3E
	 pK5xX+71pzGqxahsEMl4M6c5NTAnNb/8prC6g1yER9Q1bURP/wJd6quMw2s3kfipB/j+J
	 0dRYnyqlf2KPm4fvaC3313iaFQCh8R/RbtNF0yScm0xfFUxJo/iRqP+33ubEJbxeQrqxJ
	 gfyTMIFcHh/76F7nWX+RfBMDsqYjnK/881FK+lLQqt5GhQ5rZBjytSGWu8gTA5pvPxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redaril.me;
	spf=pass smtp.mailfrom=redaril.me;
	dkim=pass header.d=redaril.me header.i=@redaril.me header.a=rsa-sha256 header.s=zmail header.b=bZKdBbOJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.19
Received: from sender-op-o19.zoho.eu (sender-op-o19.zoho.eu [136.143.169.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACF7606A31C;
	Sat, 28 Nov 2026 12:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ACF7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redaril.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redaril.me header.i=@redaril.me header.a=rsa-sha256 header.s=zmail header.b=bZKdBbOJ
ARC-Seal: i=1; a=rsa-sha256; t=1795868178; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=h5rkDHCZKtQBfT2yHe1Nspy2It8P71IvwfSgWFDwQRIobnkVk0kr7uN3MrplL58SD5jQ2+irTVCOhRc5P4JqAMrRcrm/F7bgAW8NHL+1/p7xUezGvHtLCGq4vKtC84tTvKMnYhbYK5KtXiWEb0YG4vaac2cINej9k2kNEJObw+0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795868178; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/mLkm55c+F2jZS3KIKnFI5x7PvC0NJzUuMc7YJFVuok=; 
	b=ONzT4Sp9+Wrkbe66Nsy6w6gvNwUX7fyWgX+bqmwPMqpQyvqkVJn4QP6YcXadaX/iLI5c/ZuHQsdm6WX5JK3Pfn7TkMRu7W19MGzsEqxdpWu4oUx0AZ/v5cJOAacN40keNo8hoOtC3Ox1oH6RkHv5OFcpHCS6AoBWtWITcVZcZus=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=redaril.me;
	spf=pass  smtp.mailfrom=development@redaril.me;
	dmarc=pass header.from=<development@redaril.me>
DKIM-Signature: a=rsa-sha256; b=bZKdBbOJwdqeAQstnEepfIeHjF5U/tk2goR6LnjOXBYdsfrWEGKEp/N9AlYB/8/GIYm4G3dOJylxbum0DCykuTY0+dAlEpiCMia0158nJvhoqlsXzzqLoshlI5oo/I7X1/3jm5JTbnpZIPNsxoDXgOrmeLdMUNV8DCfc4bAuztQ=; c=relaxed/relaxed; s=zmail; d=redaril.me; v=1; bh=/mLkm55c+F2jZS3KIKnFI5x7PvC0NJzUuMc7YJFVuok=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795868177761206.675192708008;
	Sat, 28 Nov 2026 13:16:17 +0100 (CET)
Message-ID: <6cdc0341-81d3-48aa-b972-4b04da793aec@redaril.me>
Date: Sat, 28 Nov 2026 13:16:16 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Migrate the multiplexer subsystem to fwnode
To: development@redaril.me, Peter Rosin <peda@lysator.liu.se>,
 Linus Walleij <linusw@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 xu.yang_2@nxp.com, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
References: <20261128-mux_fwnode-v5-0-6689b52f3800@redaril.me>
Content-Language: en-US
From: Fabio Forni <development@redaril.me>
In-Reply-To: <20261128-mux_fwnode-v5-0-6689b52f3800@redaril.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Self-review: eh, I forgot to use the imperative mood in all commit messages.
I'm sorry, it's hard to keep up with all the rules. I'm not filing a revision
just for that now, but I need to fix the commit messages eventually.
