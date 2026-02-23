Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920D534EF0C
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841705; cv=none; b=WPtNDWTS5BPhTS9pWeRmc9bVvu/ntBlS/9ioX7AZR/o7PrIt6Xm+MzT95V2JJQ/EaGj9urWFnPT4vO+/2EnYbvOsAHaD4hfqoXCPsjaf5b+KV8UQoW3l66ShuasF1hgg8EQQxdMOmPYJXq4SYcWACBWGfkgbm1M9d7mE9pOUoAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841705; c=relaxed/simple;
	bh=7SnFX/b9BvHXEzapd4uciQ+K9sIJbb9l0Gt6Gdocaxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQq6+Fr+BPwl84h7a5F2ar8BBeF1FV4c+7OVBxy3slkcZmxgFCkMgO858mo4V71of8o++25RFGJ77GlAtXgbSE+uqj09rmx9+5/PPdOeD2tkkmgHYWncBP/4ZiYEfsSbxzgyxTFcnIB3jGIazVHHXlQhXoRCX/N3Euf+9BgOUaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqIWgwXZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqIWgwXZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50969C116D0
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771841705;
	bh=7SnFX/b9BvHXEzapd4uciQ+K9sIJbb9l0Gt6Gdocaxg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OqIWgwXZYH5ZWVS92VHalApzJrylw0Fi5gK0WyLIWemq+a/9gs0SWZGJ5kjpjGwsB
	 Uzj3wLiWwZhqctpySOy7H/6Pw3hCSvGth/D0okw7kePB1d56XkOkUOAv7KHQIIAPO7
	 8MaA1pO+DGBEtXtIg8Ll8TaGSt6rfVBKAoV+TuavewKbwuFZrYBFoDFg21xQD4A7mK
	 RPkbInAYmSsurUCMuz4lEp2kx22zB4PCEXpBIc770MXtmZvlhCVOcIqph4HiAP52NK
	 tYGHlcuxWHYVSE4M2piXim/iGsPy1iggqrrv3t/PVviz9m5nM+lE2Xez15Zk1vxZlz
	 wK+nMqM7B8NJg==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-649e97f1e1eso3088660d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 02:15:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUvsLME6lH45JQA8ZymMsu9nmFhM4Nl3TnjoPeVhQCipfVsM2KWK664qGjjnIXyfAuZ7y1OakT/JJYf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz08+BKXmGPiNVu/KR6vHU+1TcIC9QEhmP2q7LMwaN6AZiDsDdT
	iKvr4fyC+MEaOMHmEZ4WiKSsUEg9hnO6vduk5tOw/e3FuKNo3YzRHDxcJpMAaKnhYE+yvkmoZFo
	zwphNE/HvvkkB+klr8wMwkE2CUVnO+MA=
X-Received: by 2002:a53:ac88:0:b0:64a:d7e3:cf7a with SMTP id
 956f58d0204a3-64c787d3cbemr6880253d50.11.1771841704702; Mon, 23 Feb 2026
 02:15:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210021109.11906-1-mailingradian@gmail.com>
In-Reply-To: <20260210021109.11906-1-mailingradian@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Feb 2026 11:14:53 +0100
X-Gmail-Original-Message-ID: <CAD++jL=RGRd_wUWTw05FtEtArr7hK+vGqhadx1mf=GcSt+cGVQ@mail.gmail.com>
X-Gm-Features: AaiRm51XCqc-p3Eq0I8hqNLTQRdwL7fox1F3twNiE1EcD7NT7NpSkF1tRf5uk9I
Message-ID: <CAD++jL=RGRd_wUWTw05FtEtArr7hK+vGqhadx1mf=GcSt+cGVQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] SDM670 LPASS LPI pin controller support
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 3:10=E2=80=AFAM Richard Acayan <mailingradian@gmail=
.com> wrote:

> This adds support for the LPASS LPI pin controller on SDM670, which
> controls some audio pins (e.g. TDM or PDM busses). The ADSP patches are
> not sent yet.
>
> Richard Acayan (3):
>   dt-bindings: pinctrl: qcom: Add SDM670 LPI pinctrl
>   pinctrl: qcom: add sdm670 lpi tlmm
>   arm64: dts: qcom: sdm670: add lpi pinctrl

The way I read it there are some review comments on 2/3, so resend this
as soon as you manage to revise it.

Yours,
Linus Walleij
