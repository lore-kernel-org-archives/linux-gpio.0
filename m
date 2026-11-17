Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924057;
	b=jXZjOHsrYq/aSorxk/mg8w+l6mOe6OXHvJ7thaS8ke/TYIikso2/gX/3vKTcYCzuAvtE
	 qvHREXb5qDdufESP0dD3wswDgHl0b0NvYHpIEsrXbS7jsaePt3EcYXqP5HHsBhfEyIFKX
	 VQoMx3Jq16++kx9vMi/Mo1CaY9OO8gFPzAxYL/gKzJarxyFFhVxWR5fcCmwgFvUv3bCHK
	 vrJ7EJMqQI9XR9igSJG0YS5fT4rRyKShFQAT8C2gbgJRH1G9TjBnKM0ldNInx7C9SphXy
	 b0s3xZRQgxW7ieojHaLp6mZCAEL5DeKdlOnDGdrXr6JRq5pYi2oodEb60lw+EjadXAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924057;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1n4akinMU4Hf+AOUS7LX8ylkG85tkNf4WcZP+gMfH/E=;
	b=r+hV02NS9fG38UURhRBsTf5pwePPObe4/UlrbG8TO7J8C26bGY8sT8hpMnny7ZnN3544
	 7IFuw5/IHxjZMTU8/2YFJVDfWGIYRW1d3pSQxWDRhcmbp6wgu0kOFA1XkiByCkFvGkQ5e
	 1qWZydopgQagOuuGcj1vOG1BcIB9SoEhRmoCGRiTeYNbFvzckCN+JwO3wX9o/IC3GrNOn
	 rVAMk/IBTnZ9UpRpSUNnVV3NUmOsC9+fUzwgdAM4pOm5HXAUAdG03SyY1A+EjoEL5EwC7
	 2wo9ERwpH9nntPp88iwgE35qqtzlC6Vb9MdOMO+Y0NSM9LlKFo2M5kwbT1kWhwCL+WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N0OEanuk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D0D606A333
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 14:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N0OEanuk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0124D1F000CD
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924057;
	bh=1n4akinMU4Hf+AOUS7LX8ylkG85tkNf4WcZP+gMfH/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=N0OEanukXS6Mm9KTxE7SL8DxyX/MI0H/vbjirpu+EOJm3uRyP10i10RM03japU4sd
	 S8em5UDMgAqF3ZDHfpH1WJ+unNr8U4+QaoqU631+jFWK54v1LM1ZMXeiV+3S0oqAYd
	 LCaR3EuXIefsHGzJVwgsxWlbY+u1B7zw4tZqe1Jyy984WmpJFaHWCIuqiA7guWxW+d
	 U3r6OkBn2mbKRSCZZP28Fv37+ALd7EE9Pb39iIg1ccXfX13iaNM4AXULnC2Dfg9p4y
	 E0Cfbhsu4NWDndPrdhr8EVT4aGUZaYTddUw3lAhPYPz0hBANOFSMBh2906frfV5dpm
	 AYnohD2AseUuA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso4238212e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 06:00:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFp4aLUa6Fl3U0hGnMXvK1IzGENF/qMozVQnxKbXfwfF8mvpTs6yWu7EPOxctPFvZnGwyerLciTBL5L@vger.kernel.org
X-Gm-Message-State: APuU4Z+yGA2njf8OePc4U84JlCut2mFxDFPpqOgnnvuqvCE7YXc2TwMw
	MRVbER2bTXUA5trvVjxiuGXRPdJaabdvZoKpvjcheLIFuDUWhWVBbuyDZo0pLFqUyAZIpIWTucH
	aThl8MZF6YlF4j6wcEx6NuQ8uBaQAZEw=
X-Received: by 2002:a05:6512:3a96:b0:5c1:4e4c:359c with SMTP id
 2adb3069b0e04-5c1709c44cemr4959950e87.36.1794924055639; Tue, 17 Nov 2026
 06:00:55 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107012236.28069-1-prasanth.padarthi10@gmail.com> <20261109035633.93522-1-prasanth.padarthi10@gmail.com>
In-Reply-To: <20261109035633.93522-1-prasanth.padarthi10@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 15:00:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLmNSdgJPG_8dVKBLxN2ewvYJm99S+32SyKj_psa0DX53Q@mail.gmail.com>
X-Gm-Features: Aa3M54pM4N8FrMarps7ie1VxRtJp-XfzSOJDJp1i6ICkP2NWqZ4utwFMO5THjsE
Message-ID: <CAD++jLmNSdgJPG_8dVKBLxN2ewvYJm99S+32SyKj_psa0DX53Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: aspeed: Use managed pinctrl registration
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 4:57=E2=80=AFAM Prasanth Kumar Padarthi
<prasanth.padarthi10@gmail.com> wrote:

> The shared Aspeed probe helper registers its controller with
> pinctrl_register(), but does not unregister it on device unbind.
> The registration can therefore outlive device-managed data.
>
> Use devm_pinctrl_register() to ensure the controller is unregistered
> during device teardown.
>
> Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
> Changes in v2:
> - Add Fixes trailer.
> - Add Reviewed-by trailer from Andrew Jeffery.

Patch applied as nonurgent fix.

Yours,
Linus Walleij
