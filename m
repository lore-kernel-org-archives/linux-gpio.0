Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B5A471D05
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 09:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984527; cv=none; b=RTN/nRUBFNmOaZtigBPGmGRIMeeugmN4XUd2cvcinAGd1ngF2/vtTqO+CFe0yN6WMe+n4MrjLp0Yi0tWeEFiBXo/mVmceN6JrdY66aFDZ8uPMTJnW5JqhpzZgfnrDjBGa/H3dWAuTr4AjfTANalFuJMxKJZEMY7MUT2SaNemGmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984527; c=relaxed/simple;
	bh=uJyNkQhn4tJamgvNk2KKxgs4znJUgdgO/5IJHFSdLj0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dcY6wXzRR73SjxsE2BJ1K06V2CEPWWm2FgM8JKJCWGQOYZR6sFvEiuKvLCVdiEiAekuuWXhpjlLQ1tibBMK5kLtluwGsKvH7QfoDlhcVeIevU3xvABClN4VTqjuKyrzplVDDpU/B6lBOjJjRO05/O9Np+9xHezh9O+Bcnv8o05A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqW7whSH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqW7whSH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B8D1F000FF
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 09:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789984525;
	bh=uJyNkQhn4tJamgvNk2KKxgs4znJUgdgO/5IJHFSdLj0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=mqW7whSHD/xtyG/fRerqcFZjoDXcvrkR8UM/EksovZKSrUnIX2hmUnk6T8eZkVfTi
	 HDOz9QhsOm7iVOVOIy68fkXv/GznB6jR9+RHkKRDwOsqr+suotsitttWRiw0YAFjzb
	 rcihYJEoEaQsTOxuA7ur31E8trPvHhzrv+g00Wh9CGVePnri25QHTXebzVpLXOgh5R
	 LWkMGkqbTjoXd8zOuANN/D37lc218C7p0QSsR6Bev2F7Pjy7P6q+N80Ry6FHb2TVac
	 2LrK/BE38+lKUS+T+PNyHu7D8TgeZbPIpz/Ksfe/IOA6i/it1z0EAgiWIKpAHewT0L
	 1LvM1xpMfLCvQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16cd1so2527377e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 02:55:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBynuQ4svCJRjuOAXw+rD1NsuHcA+ADxh6MLMD0uJKn5i1+BghH1nDUSjx0cfMmdgPvwtwxRvprhOFO7@vger.kernel.org
X-Gm-Message-State: AFuF++kLcmk1YuWdZBws63jc6sN5xewM1muuKGFE4VephR/BtX5qnTi+
	CvuXa/+E6/kqeFFZbk98dGS2pn0T1O+QZfajuDPT0O8xV4kNzAoDOvY/atAcN/dWjktk+FA5m28
	QuSjIkvr9aWKGNPUOCC7kQdZGjm3T+7r3oEiwoOE/fg==
X-Received: by 2002:a05:6512:2506:b0:5b6:1a7c:fd81 with SMTP id
 2adb3069b0e04-5b8c1955fa1mr3046002e87.39.1789984524630; Mon, 21 Sep 2026
 02:55:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 05:55:22 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 05:55:22 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aq1OLkLiIL58V8aK@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
 <20260915014447.282121-2-shengchao.guo@oss.qualcomm.com> <CAMRc=McgPQe0x3bWYArqoyprh1ZF9owf3Etop1hqMt67nBXgnA@mail.gmail.com>
 <aq1OLkLiIL58V8aK@QCOM-aGQu4IUr3Y>
Date: Mon, 21 Sep 2026 05:55:22 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfJJb7gv-+ZQB4nRWVXrR9WYA7nSChuQm2653AvZvhwOg@mail.gmail.com>
X-Gm-Features: AcwNN1Uqvhd_siw1NE1E8ubYU-CZ0buJEhBdNNqGGcUsrVMhanvGmB1cDGLuXQw
Message-ID: <CAMRc=MfJJb7gv-+ZQB4nRWVXrR9WYA7nSChuQm2653AvZvhwOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: shared-proxy: track direction instead of
 reading it back
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Yu Zhang <yu.zhang@oss.qualcomm.com>, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Sep 2026 16:43:58 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> On Wed, Sep 16, 2026 at 04:00:01AM -0500, Bartosz Golaszewski wrote:
>>
>> I think sashiko is correct about the GPIOD_ASIS use-case.
>
> I didn't receive any comments from sashiko. Could you point me to it?
>

Here: https://sashiko.dev/#/patchset/20260915014447.282121-1-shengchao.guo%40oss.qualcomm.com?part=1

Bart
