Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B076247CC6F
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 07:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062996; cv=none; b=q52jZDkaGk875RkhyvdauyXxNsnrJrWnetzdcXQeMqZsPwQoN7Wkmr6zVe+PyX1V7U4qHdzc5LPRsY1rAuvoKktHYvQYsTgGi48NpQTCmrZCrjdSaoGTu2ynVe3eEklyBSr1GHbpjtnlM3cbg0P7hVaUvHLixvhVWFCdE+VVmAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062996; c=relaxed/simple;
	bh=llzfaO1V/laqmSK4HM6q0DcoPobUmUNb+6+M74TTYUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nEWMRJVi4Pjvi75+Ghmlu6zbH/vX+p5aJQ+RSC1LPb22upRt4TiINcvPD1t7fwfLJYAVog5db52m2iPR72yG1q41BC8G+WweMuyiCTkrrC3wSdc6/iLDj1aaaJ437CWejUdH3sa4/cFmRCmKKyWWxMS2ywiRgqUWU8zaYD4aNfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=SbYlkDj0; arc=none smtp.client-ip=62.149.156.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="SbYlkDj0"
Received: from [172.18.100.99] ([109.238.20.116])
	by Aruba SMTP with ESMTPSA
	id 8v6gxQEfXbk7m8v6qxujud; Tue, 22 Sep 2026 09:40:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1790062813; bh=llzfaO1V/laqmSK4HM6q0DcoPobUmUNb+6+M74TTYUA=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=SbYlkDj0Cds1cHMpY24YqoYmVLUN6UJT8IwjqPsEA6I5L9deYxfMfjAm59EgXqS+k
	 VZcitHaxM8S8zLGELTTmdlp9c7ALEoL4M6xIoYbdwwY/SaX4wCWnVzST3y8+iKmgJT
	 tAFTCoCKjJHjenC05xfkBDeYf+fLVxk2YD3N0fTMOg914XVSP4I+LmVrjk5SOToZYx
	 rPQ0NJgvw49elF0jSUbPNEkrcHQDRBPqDSkha3x/yRWFZkGl2L2JYvf2kNy6VOMHiK
	 Rw/d+Ya8q/sD6dNyXH7lqu8yIcC6zEKHUDAxgNcQl/AZzgmcYru6VfIKM0b+NeEKSa
	 uYhKe4RkTi7jw==
Message-ID: <01f30877-07df-460a-94f0-e655485b156b@enneenne.com>
Date: Tue, 22 Sep 2026 09:40:12 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Content-Language: en-US
To: Eliav Farber <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260917075611.47881-1-farbere@amazon.com>
 <20260919171157.5502-3-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20260919171157.5502-3-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAXhmN9VZ+cI7qgXN+FYxYuo8sNQjY4cjcJgPcoyTqqWm22W7aebxnAz4340tN505E/lwSp+IRo6OimR16fSP9SlTL8bTn8XMRVxqKroRVGQwtQ+QAvB
 fWQ/1kDd058LzdMpMRK4wxCebYil6LLqrGCJWyELhBDjIcyDBxmxlfcTPC6Y3ooSx0CpSnqlK77qy3PmYRwu24Ex1i2BRU1wzux6JevBWa8dPd1VE+JHqUgs
 il8XtizrU7Jaxrk8e+sNV6wmCsqPVhD+PHX9Ziv+rqtDZ0v4hHTwQ2zyAE0/CHjrVjrKYFqM5dqxO5x2lvdD7WyvhASDeh8IsWmQa2RfSwX6LVJPTPp9EnOa
 c8ktqqoXqruO+pezuf1RK4mp1V60ZS6eIRW5Ty8fjM4ljFba0srwM6cQa6w6kN0RW5HBDwkINJGHJQ6wZulJ8oW7uQvPLBqtXeNLJ7y00xTzlOPiB40N2ECn
 AiYGjyNYxSJoaHPDWEehlEySWYaie/qsI3CvXa6X3gebRA4nzgdWphlnDtTUAMo2LhrEYMVu/beOVdvzCeKGMcui+6LNfmiXfY/2cQ==

On Sat, Sep 19, 2026 at 05:11:56PM +0000, Eliav Farber wrote:
> +    minItems: 1
> +    items:
> +      - const: default
> +      - const: inactive

Just to close what I reported on v3: I ran the binding check on this
one and the "['default', 'inactive'] is too long" failure is gone, so
consider my objection withdrawn.  The binding itself is Rob's call.

Ciao,

Rodolfo
