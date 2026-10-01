Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95FE36212C
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 19:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883936; cv=none; b=R6gLoKWfgGNWM1Q2IkzwgiaIzIGAgl4gZl6MMFcSzh9SjwuN+n3qYVnnIcMSRbIn/Rqg5aTe/LvCGXKmvrlCCnRtBPICVNdggi7a7UrBtz3Ax996lvpp/0fEukbGE0LXJqQW9vEdnIfG8Gyp0xni1rNp1MoU30gcrMM+slpTHUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883936; c=relaxed/simple;
	bh=33moDgAMLZiqd+hf0XXYFfrjrKIuxRXmRKDthUAbkFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JAE/7fZYBFnea1QHx+dmUtMBeRU8uWcUNo3tgPEzpktjhtjyR7W4rUSXJB4q1cib9KHgYobZNG/Y3p8rMGg9LPjYeEDRRH3AEnxQCZ1RmCIF6YhcJdGAXTB84PKZyyprt918ys7o9pRb/HWa2ZB/vE1paM8FYPtT2v7pl/KPSlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDzbGA2Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDzbGA2Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76BD81F000FF
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 19:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790883935;
	bh=33moDgAMLZiqd+hf0XXYFfrjrKIuxRXmRKDthUAbkFk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eDzbGA2Qxg8XJDWc1LA59xR1UI2Je4OI6ROUEScWtHH2SK7vsl0lGlc8i3+bMf82B
	 YL8nZ7xvjkR193G0c4xENrLkGhUSEMQU/j3NC7zT1KswkWOaL0DUfEQ0ekeEPbHAuu
	 QFsklDuAKDdK98ZCmlOm1k8XvOZyVX84u8zN1om2j9/vIyOhkpYA9aaXD6be/hQZSc
	 Q5kB/cu1oNGYopm8dYVEKGQ6UXBAjF0XTCenTiFVDNU+cOzWIpA4ezYO4PA9MQCxgg
	 o73dAvK784z8S4445T94IDtgrJGapXBmIPy+HdVe81VsAxcEs/fa92tZXvT7Wj3Bo/
	 oZwCtSfvhG1sA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5bb7c0d89acso297454e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 12:45:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxL8wxCGZA3ljkSc2I3QZNe8+MrjaVVRPXqAGqB1qf/cqEyltqJIk2WeCfK98Cu8RdVMh1nchFtDL1Y@vger.kernel.org
X-Gm-Message-State: AFq9FYJTcLB093jvXogobi1CFBxzhV4J+1IypIK6Uurph6WDTKol/YWe
	NGXyJK0VTYrRG49+5GHndXiT6vmhleQFsIomXfPQAfjyZgz7Z5r/vRp7k30ItHbMdmj75PkgaYX
	PwdKx/k9DW2uGYt0T01Is1zv8g36o9lE=
X-Received: by 2002:ac2:5deb:0:b0:5ba:3ec6:bba1 with SMTP id
 2adb3069b0e04-5bb9bc42fb6mr57014e87.54.1790883934259; Thu, 01 Oct 2026
 12:45:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001123730.12157-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20261001123730.12157-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 21:45:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLmdRNL2OqciO=AY6dgn+NnvT+yoh1+GH2BTaiHqNcZVog@mail.gmail.com>
X-Gm-Features: AclHuK_fGSPV-52TcTzJvjoVjVlbgAHX9FPDV5cSDWzZEh7mM5ZWj0ScQPFySDA
Message-ID: <CAD++jLmdRNL2OqciO=AY6dgn+NnvT+yoh1+GH2BTaiHqNcZVog@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add git tree for the Qualcomm pin control entry
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 2:37=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> I stage Qualcomm pin control changes in my own tree before sending them
> upstream to Linus Walleij. Add a git URL to the MAINTAINERS entry.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij
