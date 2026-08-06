Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF5E4248DB
	for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2026 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786052878; cv=none; b=R7cv8iD9hp8W2whGjJQhsNktWamTKGWudR1rwNS+hMGWNOaEVyWOc4OXbSnOSwWkwfMXqhJop6npolYOnt9Ys/0CZxrLN2e8Ht4Sl9OXXHoSqCE1rFykcBquWHF2O2Eqadd8Sg20ezX/5UsxCM66oZ3sPCIqZsHbrykBydFdvU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786052878; c=relaxed/simple;
	bh=CaL5TsSLfvCa3cDrJz+Yqsek3VoUcRNh2Kv16NL3Z3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCdLSNgY7cGtXqP+KraLtmzzEKZNehg8gFPxEADl7CIG8zwu66z+CpyIi/lwt7Cj+YBDZp/4ykPiD4JSLpkkgnCyl2ru1KqLEY9899R/RcLjiEhoanI/T4IF7w9CLEB4TRWP8HA95fyzzVz904nZwlDGnGH8IfGvsuFhRcqeto8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvzzFU1m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvzzFU1m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61BF01F00A3A
	for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2026 21:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786052875;
	bh=CaL5TsSLfvCa3cDrJz+Yqsek3VoUcRNh2Kv16NL3Z3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DvzzFU1miAzRlp6j+eonbpWh4X3cQF4Zf8ip3ufvQ056MS4NxAMMUIyeGkwdJAZ69
	 tnWU83SVFGofvLZezJWkkYcyDPssUsh5ziJinzY6FngfG8/eOco/4j1nVt+Mu9VbPc
	 1cTKWylUBgVTX+o7jN/ew0TiL+qRW7BCEVonYxSpka7MpB4z5ilP2ZhA6odZx/10+0
	 S+M+b9JrsmwxtOODIRmsvl4OJqtmCCptpYEzTe9VCKZmbrhXDNMkZq9LcxFkXz9XG9
	 5PIgyCFnc1PtfbnEOOyg3n884tTdcZXJ8+DLi03HFUg+fThk2yob00qliKrCmvCdc7
	 B+SazV4W95Pzg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so1788186e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Aug 2026 14:47:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrG8xmnU/vX6Kwwy6ftPuZxRxUUVLnAz+I5IPuSuqIIZzcl7JrjM/oMjA9j5XedBVnWy0Lv2TAOUkk0@vger.kernel.org
X-Gm-Message-State: AOJu0YwyVSHSJXX92RXy4ezX9lFThTDfN2QUS3pOLL/HLqy3ZbyifZld
	+7VXe+C2LjDByz7CHbhUgiTzA5Wed6xlHAWeC8vOOymM4mjpBonkJb6no4TIYC2TDmns/4r9Bcv
	hnp+zVhbCTjyy81EIpSffTkMjq0mfBtE=
X-Received: by 2002:a05:6512:39d3:b0:5b2:e178:4088 with SMTP id
 2adb3069b0e04-5b2fe39cd5amr1905632e87.4.1786052874207; Thu, 06 Aug 2026
 14:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727141121.772110-1-pshete@nvidia.com>
In-Reply-To: <20260727141121.772110-1-pshete@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 6 Aug 2026 23:47:41 +0200
X-Gmail-Original-Message-ID: <CAD++jL=b8B2YVB3dHkPLOYDxiffaST+CgbYy50aaQ1mPFyM-6A@mail.gmail.com>
X-Gm-Features: AUfX_mytEg4ToHSuhGJgiTmxeaRsRUFU0bYKV21UeLQlt-Z3TQER_mVGqT2sPSY
Message-ID: <CAD++jL=b8B2YVB3dHkPLOYDxiffaST+CgbYy50aaQ1mPFyM-6A@mail.gmail.com>
Subject: Re: [RESEND V2 1/2] dt-bindings: pinctrl: tegra264: fix DAP2 DIN/DOUT
 pin names
To: Prathamesh Shete <pshete@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@kernel.org, jonathanh@nvidia.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 4:11=E2=80=AFPM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> The DAP2_DIN and DAP2_DOUT pins were listed with swapped ball suffixes:
> DAP2_DIN as PV7 and DAP2_DOUT as PW0. On silicon DAP2_DIN is on ball PW0
> and DAP2_DOUT is on ball PV7. Correct the pin and drive group names to
> dap2_din_pw0 and dap2_dout_pv7.
>
> Fixes: 30a9d5162f25 ("dt-bindings: pinctrl: Document Tegra264 pin control=
lers")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Patch applied!

Yours,
Linus Walleij
