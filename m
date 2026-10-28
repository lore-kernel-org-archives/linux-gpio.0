Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793163203;
	b=VERa3mj+1HGKeTFtlxTpIO15X+QkXAs394H1h3+TMptBREiv4qCHUtQPoQYWmSFdyv8e
	 z6k+EPwJYR9QupZkGy+1hE5r/Z2CXng4pRTxUAAWkWJR2h2huqGR+0em834ZZj4aha5Tk
	 Dmq727M9wrr34aokxucjgrrzNSI7X0jz3h9pkKdE2rwhBHVdYfvqw3Klb4j5rZDdiJw5N
	 cpRbi0FUn7QY5p6L1hRZ1jyT4+x4q2vAQDbuBaqh90IgrXq2jCRGECOqUYTn1of1+zBtO
	 Ti9WiN3RufW5DSVlgoWJ8rdfhiw+LtujBpN15p7WwlUC/X5FQJZCpQ/nA2zWdvv70UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793163203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iMvg9EuHuu+x9NUwMZWsnJGwMCIhGiOL6i2k5eUcGIU=;
	b=BM2J/Tvw8gixDlSz2NacNqqdMGSkM5cTx758sDThw6C2hR/8qjxjsnXhX8gg6w1fmtX+
	 dAmdwZGA3kgbYLhx22LOFAWndxyBZ5BRkBALAIOOJOlmVnGYrzo99iMnJ+kF2xsdiQDgu
	 BdHtg/Q8HfMemJ967M0QcPRe+PFOOA8MtyVP1vMQcyB1FtkwF8VD5wy92vt8D3Z/q6Bv/
	 KXxKz83p2UE7wWcfVX35f+2cP3xbLv9DPmBY1JQUPj1SN0CqG7kcg6AOned/ivxsx+G1k
	 UxVudVMDV8tLiLb/UuXDrQDOU/0ME0k5AOJnqfNFPeoSwqZNRN8tyTTHcAUmt8MgLCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tOpnL67Y;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6745F606A31E
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 04:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6745F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tOpnL67Y
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-369f3e9e431so385764eec.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 21:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793163202; x=1793768002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMvg9EuHuu+x9NUwMZWsnJGwMCIhGiOL6i2k5eUcGIU=;
        b=tOpnL67Y1PljKsF3ziaS9wAhsBV5kF3kmf0yRJwDX+pXgmLxS8Qwi45H+GtfdqVVZB
         1qNHlx4j4iwfCilWctQBdR+wgcs8sDxZmBr7a74BGymY0F81SIG8lrqBC5kFwuCcqCkA
         nOybCI8az5UoI9NQeZ4Qz9t431NYzE4wrSxq6rg+7UBf9yseMpxWc25y41AtAjDrvzTv
         TAHA18rRwSYt4g6cZ/2GsSJUrpOMoQuQkrAxi98RvtbJL+auwGvfzA84v066kWZmLEVi
         x5cpq/bBXAKPHd0pltPABjMSclgbcg9S+XC9qTlwPSX05aAKsCMDTnRanVBu78qQc6uf
         doXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793163202; x=1793768002;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMvg9EuHuu+x9NUwMZWsnJGwMCIhGiOL6i2k5eUcGIU=;
        b=MoISWxW3vWxMcyhDFFcnG870AomekpD/DGncEUpNfcQ7/jqx+PLSYTByTbQHy9wo5S
         aGIFjXjn/WvG80Qi7jeWd8G0P1A+iDB5aV1uJv3KDKoNX1kuMwWydIDW77LVnhr1UNVM
         BYJtm5LdhuKVMJtS1HpvgNabdTRxH7JLQSRJXldQMgPPDKN2Mue39wSQNLzNqOFGxYoa
         WYbA9EuqsuZ37BpKJe9XfCaaIGKwuF/hJ8rMtWiObReMXYxWSDfpKKwFAG4UvKnf6IO3
         01oiT/2tQOoH8KFQiCJTP509M0rpYzcMgUPQVhFXGZ+UqdEcXfo6oBdSa2+b/kcyPBqU
         ZUfg==
X-Forwarded-Encrypted: i=1; AKwUvBxd23ykuQIeM5BD+hqczvA9O0xFrRYX6hhloj1zh4KiuDUAjWze6gp0p9wEc+L3BiEGntUwVd2Pb+N0@vger.kernel.org
X-Gm-Message-State: AFq9FYKS4nCKyN9lY6Nii96AOuc4Pi8juPZmOkk9Ky4VLEiV17IVlXop
	fv/emhWh3jIBHAEbxTpQKFbl9ozmy9/4674Of7rzePlFAr3TlI6Y00xeNeOl4wbrNLk=
X-Gm-Gg: AYBFou1d/sZfs6H5P4sfS8oVuGMg7krIvMPHWpILtMmMjBpWjUiNHFSK5OrcM6oFXIn
	40ja49FVfb8vxxTr+lBuVtXiS0AdmhtHnP0RITM6Td9K1TxdqWGEOhCZNLfk6WxqazqykXaAr32
	SXfiLmihWhGCZ3izFmXG9YK8n8r5+md12exgh262ZMKO2lIsUDQZIsq3suh0mV9DRm4nbXPTPF0
	WwGi1ARxmOTmjpum1zHizlz5P45dqFK+QX2NPoSwmd7mOQviSwUP6VE12+Fm0gzSIMNhXVzJ31W
	/nd2M+cGdAgmXDvAm5TMPAPXFi7tk7zpP6xCLwhtE+jjzueJQbtAsHViMM7hORF103lNvwN8Rwv
	Xxv3qhOe7+LavvKcVvjniJeqJFBLce9lAJwIS0CTklbr7mLML0k9VpLkSGFvJz+QKtTxD8NxYR+
	NQICALyPkwCgAsLt8vNqtip+dTvXKboK8vdIsn44AYOc7LnepK4cDd/Oh1NTAFaxdNjN5u9BiVJ
	n/olc8YcNdMYnXs0gsDBtDd9c0QDdjCsaE6zoAtFZbycVVCC1xTe/Mjq9u/UlDTkM5oyQd8FC3u
	HKWUzcJhLNyWAHyYJesmBBhMd8gVfvE=
X-Received: by 2002:a05:7300:a212:b0:367:a092:3c73 with SMTP id 5a478bee46e88-36a0f81af52mr6190963eec.12.1793163202055;
        Tue, 27 Oct 2026 21:53:22 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2395bee6sm1963997eec.21.2026.10.27.21.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:53:21 -0700 (PDT)
Date: Wed, 28 Oct 2026 10:23:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: virtio: convert to immutable irq_chip
Message-ID: <auF_vjF6f0Y7dBHn@vireshk-B250M-D3H>
References: <20261027-virtio-gpio-irqchip-immutable-v1-1-f64ed13d4567@valla.it>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-virtio-gpio-irqchip-immutable-v1-1-f64ed13d4567@valla.it>

On 27-10-26, 13:55, Francesco Valla wrote:
> The kernel has been warning about non-immutable irq_chips for quite some
> time, printing messages such as the following one during initialization:
> 
>   gpio gpiochip6: (virtio2): not an immutable chip, please consider fixing it!
> 
> Convert the gpio-virtio irq_chip to immutable and add the relevant
> helpers. The exposed name is kept the same as before through the
> .irq_print_chip callback.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/gpio/gpio-virtio.c | 41 ++++++++++++++++++++++++++---------------
>  1 file changed, 26 insertions(+), 15 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
