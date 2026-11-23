Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463996;
	b=itpSwF2mGEjZS/bDzVJP+D4xsDJ01KeHUZ3l+eYCWxtDA84ggkDEWIlUmjI7ElfyPlKV
	 u38VSV+tfJCjfz1EDPM4bPBDnpES6Ue53RzVxH0jNyEfRbFe8YNmviKP2+xurMzWulY22
	 Xj9o0iCLswMzKy++r23HAS/uuYxwKnvUMuNCk3zTYeISGa+6eyiSGrSOg3CBY6bP8yuHv
	 RRLOylzgXtCamcv2i/b8P8iQyi0o5TaVSDTTOtgvXv3MQEiNPmX8T/i95Lz703Sg6yqsk
	 jlaYTmdCS2r0BOGRNGRVOrITKmmCbUJEK3lbYr8XDBcm1exrbirsLzhEjBmAyqLariw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g8D7FjHM0xGs0u5fsJgGRY1OLWeFaHEMIdi1LwzAiTk=;
	b=n70pJ26He4nE28Nzkwp/pbQljNkM2smVWp32cCCCaQlz0E3zTpNiRvxvsqHie/oc2F3/
	 xzRHmsyEgTXhTko3eCzLJABjDImgDLyciqzT6iuaf9+u9dE3lyZpLVevgHYLpusAT1v7+
	 8KUD8WBuutwZweGxXqfpDwH7AixfLls/8U4kfcRckY845zkzRnZgYXvIe1LIM6xawrK5C
	 clU/4e1jEqG5niqFuZ75fEhaZ2QSbLH7IPEW88M/9OLGtnld+gh51CiYCD1qh8eXUKuKK
	 e+1D45TFls6L7bZ1GTD7LC+IsEYG6ICGtjqhbo54YAga0L0hQ81w7yklQYfVM9KUdjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFHeGqxX;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C59606A32E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96C59606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFHeGqxX
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so608372466b.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 11:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795463994; x=1796068794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8D7FjHM0xGs0u5fsJgGRY1OLWeFaHEMIdi1LwzAiTk=;
        b=CFHeGqxXFkgbioxsx902NP4Q3FgTr+AgI6YI92t5flfnFbdo6XafKRV+quirlSXi+5
         yD8hVEGvro2b9ofUpHjLTq4sUhcrzTX9tc/OJyK4TPFKYFKr3UlsCMXqGo7lZJiFKKqZ
         vnqzwnkm/BCMhXu0WB96hjm+88ErR3E1PfbziBDjdTS+rCi/diFkrqxSBPJsN+znXLDY
         yqJ9vcDfcMNo6UWkiOWDoXDimVIL2I2Lt6bpHvip3j1h/KGqhMvu9/ci7Lz6WBUhSN8p
         s/MkpBa8/okjzYdWa7jwpUytJxLME15MOUjyBVGpvQQHUiA9nyf6X4v88+9QxVg3yYBN
         jnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463994; x=1796068794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8D7FjHM0xGs0u5fsJgGRY1OLWeFaHEMIdi1LwzAiTk=;
        b=QWNRVQ+SzcKgr/oHmxn/PI/ZMbCQiitjK853rtW0gK9/WiQdw1RWweJNEudD6WmD5F
         vN3QhKDjuJpe7h59OeLEVwN98PUf01TnsfiTS+U4sc/9gnqJ6epuJHtaWVwrJCHSPu3q
         rOHuhyYHmXC+YQXUClmCBjVkVt+CrsnfEhmgMOFTmcaRpFrNYfpbMYzSZnRvebePELGD
         unIRq3QOULMre1svdGvNnlqLG2K8HnYcMJ/lZsMow06vksqIYmfxPIOz12aQpnBRV27x
         RRDYd1rmbKylg60JRsXaY8w0gP9hP3d2a4ksF+Z9ud8qKt492MzCCTaGJl4/EZN5VT/E
         BN5A==
X-Forwarded-Encrypted: i=1; AL+hErGAiyYT7cO5+WxSw87uU5a0ESc12NZR0W+TYREFYoFjYVLeUEGAPth1ADPmBdFY5roc2eeXJ6WjIfih@vger.kernel.org
X-Gm-Message-State: APuU4Z954IgMSFQZvdeQSzXVbNUNqfJ9LFqYQztvSMmJFRbGtFAufkSi
	jC2cZQGhsKvI8TVdDE7VTzXfzFWWxVhVB5t6VgQ2ppPZcvdKbxxu+CfE
X-Gm-Gg: AZFdTZeVF0u1N3ebjSzLxMi3FOm9km+YsKJb9CYQFJ16dH6xJYMi4qkeCGAhonFPqF1
	sg7SrvUqEK5zXJ4gVDtmDvmn1xUqOltw7RMVkCp9olTqKjT3dPr70uKFRzUoBASlWN/i99XiOnc
	1XQQemMRiHgurYv6SH6G4onvCF6dI3KKUf8iWTJfD7Ic4h8PaE90Pvsj674iTaNFI0V83VTZidg
	bzS+nQyxTP3vBEGCmpi98o281/JIMEe2XnLOpwIOnfa/nxDE4zdOYaWL+I5omYaxrltoNCp1N9N
	LtPwRAFsDo5PHI4eoFWxPLtUVgploUHbzQJCynunXZgNsfqNnalliD2IuKypU9To/Zj1zFk9ti9
	cKPIXIhI63rfbz2FCtClWGnWMMxoKmkss2KJDs7DLDYXqjwPHGEkKLUe4WeazIlUePcbUwi49kc
	2PKSX6tfw6wbF31Vgsad80m3+Ip6Iw07zt3ojupum1KDq9uOkQwGyr8EzO13fhvCjdhq0jztNIm
	m2V/RxTxL5/pvAoFpn6P2JyuuJZpzrN9grym3xM7Bw6OjrblCPaUWusaHy9CjkWbRSiyW1Iu6vV
	C+i0JsdhdJC9EdphB5oolpVmHrrU
X-Received: by 2002:a17:906:e28a:b0:c31:e958:408c with SMTP id a640c23a62f3a-c513aab021fmr708355066b.38.1795463993838;
        Mon, 23 Nov 2026 11:59:53 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm438660266b.8.2026.11.23.11.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:59:53 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Halliday pinctrl driver
Date: Mon, 23 Nov 2026 19:59:34 +0000
Message-ID: <20261123195935.1046144-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <su7onpn56wd2dtsn63qwbv5v65kci54rhqjndh6qjpb6gwlwnj@m2kxvcdrpjws>
References: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com> <20261116-halliday-tlmm-v2-2-b4dd502ca142@gmail.com> <su7onpn56wd2dtsn63qwbv5v65kci54rhqjndh6qjpb6gwlwnj@m2kxvcdrpjws>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 05:16:55PM +0100, Bartosz Golaszewski wrote:
> Can you verify the pdc map against the interrupt map? It looks incomplete to
> me, there should be more wake GPIOs. Unless you have a reason to not
> include all of them?

I do not have the interrupt map. The PDC map is from the pinctrl-anorak
driver in Samsung's kernel source. There are 93 GPIOs with a wakeup
enable bit, but its PDC map contains only 76.

I did a test: set an interrupt handler on every unused PDC pin on
my headset and then I toggled each GPIO to see which pin fires.

1. Out of existing 76 entries 42 PDC pins got triggered. 26 are used
   by devices on the headset and 8 do not change their level,
   so these 34 are not tested.

2. 17 missing GPIOs: only 14 give a result:

     GPIO 42 -> PDC 105, 48 -> 87, 63 -> 122, 80 -> 42, 97 -> 96,
     105 -> 55, 143 -> 72, 151 -> 118, 168 -> 94, 205 -> 130,
     218 -> 124, 219 -> 68, 221 -> 133, 223 -> 134

   I am not sure about 151 and 168, their lines are not quiet on the
   headset. GPIOs 114, 125 and 162 do not change their level.

I think it is not a good idea to add these pins without documentation.
If someone can confirm these pins are correct then I will add them in
the next version.

> There's no egpio function. I assume you copied it from sm8550 but I
> think you should do something similar to commit a326b0523fc1 ("pinctrl:
> qcom: sa8775p: Enable egpio function") here.

I'll add this in v3. EGPIO_PRESENT is set on GPIOs 185 to 223.

Best regards,
Stanislav
