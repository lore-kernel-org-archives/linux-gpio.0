Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971972;
	b=xv4pbis4vfwPPFptvWTW/C38KAN701ejHZ5BiyX7H4qHucEUnp7FWXGCzJAqAsjmsFrj
	 euQcsQtDNysI0JgAIjALebvgzxV8P5H20OXwtJ7TRpdoWDgCZlNJSzj4FgRx5+cggqqZn
	 pV0p82NJ242eGhwvyvWA6iLn+elFyQoOLTzgae05aYku+p7teeRp0N5ppo9C0ne2V3guJ
	 aqzNhhPUxH1YIAG3d/rDxNwJAckoqW5iaOx6eLQQN7/byrnWcE/zBltyZyI31YUvDs+4F
	 tUXlTEVuTjshHL+zcwGrPJkYMHgm2rt8r2LTujqCFpTodLPSsxObob+/MUg4ANWv8MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971972;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rku6VQ65uTS6RI9RCpBqPT6w5cxyM8TaHvzEHY5mMwI=;
	b=yPhjrOGS/qNP9V+ZcPj6OPVEWCiPxxubIImkIbrcGUP/S3edlKBpR9fa+vjWhW0AeD28
	 RO5l4jOMZAAM+8+3lsniyiYsbf0JDd5i3clIllAHfOsG3wyXMYNX9UYrgJ9bGSZM3Wn1s
	 N3wLST0LJlN/RcHN0XeXMuYGWnC04ZXD1G5/9NujUH9utLBo2XsbvHubnyYihmuvofKsZ
	 9UjvzyPPvV5oXJmFKyJC4enrqMWvH5J5VW87OVev1PlauJcuX5KEycwyTvYXlkyNjvHZw
	 JilTw3RNYjSCAbhAukkRiIYIq31oyhxLE/NOJ4GyOSK4iSPLpQHg/jmtLEdxkGZVwTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9eBh9oQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E118F606A329
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9eBh9oQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722071F008A1
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971971;
	bh=rku6VQ65uTS6RI9RCpBqPT6w5cxyM8TaHvzEHY5mMwI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n9eBh9oQfW9QCKPsygCwWyF/4qounZ/O6A5URte3/mGT4wDo5hBPi/dIdCTZd53JY
	 5qIyXnE7j9tFjiOUEBofK0DNfUNUIFPsUh7j6uQduWjMZBpnMXtrKBwFK+Q1qNHAXk
	 B9Z3GRa51Ef4Vi7aeTRjbuNaIoidw50ZG30mQdXIz6sveTRcQ1BPagOtDaxeOnShtG
	 ny9HnDN51yvQe8NDClYkX3AdFmjWzVp5cq0sboZIVU6Tmr1j5Af99pyrweLr2aWYw+
	 4SmIsRuXVQkrqioZvYwXV81owk1tCesy5hT5VdGmwmVOEbdjb8FH6LowXN0n4PNSLb
	 cwDTVoHx32aPw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso683215e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 05:32:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwkdWCXH2QnPdDYHlneBgJWY8MQKraRMLJZr0qIpEjqJnKcD2CDgoKRrS5tyIlAeF9YU2A1YlM/NFOh@vger.kernel.org
X-Gm-Message-State: APuU4Z9zjXBnvs6bTxHP4yQnUMHycKkJpLqQ7rUNd8rKSUm409Ntjaks
	S/oV5143VLTbv76ktPuolyqD5JccdtcolOLeW0CCgMMA8L1gEO1+9HDhcRkluLK/dC84Dy1gpyi
	ykwQkHCo7K1bIoEcaTV8/E/omkGeb3ws=
X-Received: by 2002:a05:6512:2287:b0:5c0:4c9:a4ed with SMTP id
 2adb3069b0e04-5c004c9a616mr663332e87.4.1793971970285; Fri, 06 Nov 2026
 05:32:50 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-superm1-pinctrl-acpi-v1-1-2367e584912f@kernel.org>
In-Reply-To: <20261105-superm1-pinctrl-acpi-v1-1-2367e584912f@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:32:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLmA7cpMfYiFrpJJ89=QW+XS85wg_VzqyU5C=pDWuxnHmw@mail.gmail.com>
X-Gm-Features: AclHuK9U3egiiUujijb5vInGeTIpSRkU7PBiBdg1W14kj--CHWhvbS-XNc59sTg
Message-ID: <CAD++jLmA7cpMfYiFrpJJ89=QW+XS85wg_VzqyU5C=pDWuxnHmw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Drop CONFIG_ACPI ifdef
To: Mario Limonciello <superm1@kernel.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 7:03=E2=80=AFPM Mario Limonciello <superm1@kernel.or=
g> wrote:

> commit e7280ab196ba4 ("ACPI: bus: Use acpi/acpi_bus.h without
> CONFIG_ACPI") added a stub that means that we don't need a #ifdef
> anymore for the _AEI check
>
> Signed-off-by: Mario Limonciello <superm1@kernel.org>

Patch applied!

Yours,
Linus Walleij
