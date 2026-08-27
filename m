Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCF447A881
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 15:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844986; cv=none; b=knceJ0iho8B+QNcAw3iRii4Hwjepasuzypze2/HQaLZVFPQxDZF4XkUwjMMDBUpjvxRyu0f0256K3XT1QV6LxlpT31+012boSP9XwrA6FtTMtp2H5HUSrddE45RV51AO/CUiAOHlpuBREh/qaOKA7gE2TkjAAD26d2LNByauYZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844986; c=relaxed/simple;
	bh=IXit39jokJOkDKdV9ozjAq5puFGqOrTpsC39d5ly7YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZO9oKTpHhp7VFpoA14Omfqgp2RiJfKcUk1oTxCW8mT0Rp97mpd5F8hviQoX9mTyhoG1U8j0YPpcOide0eZazM9GnBKztNORJ+/B+hJfa8d84C3pYiInhr5kw7hr+A+Ko+tSmayl2286kLmdouGHQk8/GEoTK0hIurM70OjCnGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ndE2+w2+; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ndE2+w2+"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc891373e0so28357605ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787844984; x=1788449784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0GbLwFaHwwzrHQZ6KyEJK5JW6SPWToNlMJADlPNRPk=;
        b=ndE2+w2++9Cg8O4juXiYVelRJmQ8+HFiDcLp7iuv2/g7qeuZ7eILSSdAxdPszUz7Ru
         2wdqKVTcdG4fFxooYcxMwvcd48PmQYg9OnSktXlAtGgzXVuWhF7323RDH/BceKPxVGl9
         HZxfOc3C1ZZ584so24PKu3406w1E3Chggu+jPmz8dhJcJqcHPIcCJLC2HWvVoFcbxNq7
         6BcamcvNRXPIyXosEwaDEpEEAfjtdzd2gDDajE53qYvQeB46xQJIPmae0qfhglOxForA
         RZ6ubRz/zBjMWcj8WQKKz2h7UFeLPdh2FPgTU2Aig03NFM8CrzTHhUBSci1vLGA7tU4+
         Rsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844984; x=1788449784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0GbLwFaHwwzrHQZ6KyEJK5JW6SPWToNlMJADlPNRPk=;
        b=lJqucnB57IpZVMUGZTsyIPAQ4uaNQVGslEMIzXIjacFoQIgc5+DZnIuzZFQnr2q4Ad
         jiUf5ajJdzxx201uLzh+mgyFe2mDWpzJGAibzhG+pIYiGjHF0CuFcUjY9reuxwTWMsVh
         SJ0kXTlSPe4BRB2BkSUncamt/baZsbYV7zbIlYLUSbA19ZEH0afA2yrrWjlBdexpPwqs
         ooKiBmaGKZ1LP3lCB4sAdFZmbKcVn4Zqb9sUGVItAKq9YZ6WEguVQF3F8z/K4tiPI4ft
         NDJJoKqAQkopbq1ReyZzQT8BPUtBK5Dm+ylgc+ee/n6SxjrJEhW8mfpaGD6eY4D+oxb+
         +f2A==
X-Forwarded-Encrypted: i=1; AHgh+Rou4SsvIYBqWpiOajJlwwZpwIrFOBjFzSjhG4IpJdseACi919N804gbOD/bbT+4hm9rCCXIbid22QNk@vger.kernel.org
X-Gm-Message-State: AFuF++kcyqHd/5fEL0AioGXLG0C8WO5pfQuArw45KJgMewwEkfVmjUBi
	64g5VOVO9txe0SJ/5Ssjg8YQX+Zaurlq0vOAldoQoQJdKDgjoxeCtgpdV2C5Kzx6/GA=
X-Gm-Gg: AR+sD112CAfM+nNj1qKCK42pGzuEXtmKdDj8v6kLZiR/rfRFdD6HP0T2k5eWBe5HPyg
	Lgl+v+b/dsx10ZIbdG1r3VxiZYxLgFB2TizPzNn415MudCng3MfPGlTEhaLh0pupQY46kFe2jD3
	A2UyjsPMedvtZDVHsf+swrMyR+ujOLHZINHGD/Ic6awX720E91HNyiOQpxgAvFW/hwthdA7WC+k
	mf0cMaF66H1gI1TIN2KNCcDNWK8KOFNKMj7II1B+3SoKct51iq7WNn4qeF3qSS7yjCnM+W2RvbH
	0IKc6QQ1rGy5d5RwR8fo1uzjwzLOB11xl5YB+pAD16kDk9bOlsaKXN5iiActF8Kuuk6X9GPvyxB
	JuL7TXwNW0cG76PsMcibQnUlFzD7TeIOcn52sjHkKBlcxrZBhTYn7NVydBexT2fqj5iJnTA0zo6
	+q+aCtL0u572WHjXfUE9BDBBsceU24F/UGzbItLlanUtc9vH/LJ/lwIqFAirMqiRj+
X-Received: by 2002:a17:90b:5188:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-396d0ea530emr169425a91.4.1787844984074;
        Thu, 27 Aug 2026 08:36:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:887f:45b3:fb30:8d79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm3187307a91.8.2026.08.27.08.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:36:23 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:36:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	"b-padhi@ti.com" <b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <apBZdNozfoCUp515@p14s>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
 <CANLsYkxZbr9hKaJJGXwYXErLwQ-A07eb-oeNXY1CceHHa0Tdmg@mail.gmail.com>
 <PAXPR04MB8093FA9283357BF9604BE39F89AE2@PAXPR04MB8093.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8093FA9283357BF9604BE39F89AE2@PAXPR04MB8093.eurprd04.prod.outlook.com>

On Wed, Aug 26, 2026 at 06:36:54PM +0000, Shenwei Wang (OSS) wrote:
> 
> 
> 
> NXP Public
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Monday, August 24, 2026 9:39 AM
> > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> > Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> > POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > <andrew@lunn.ch>
> > Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
> > subnode support
> > > +          gpio@1 {
> > > +            compatible = "rpmsg-gpio";
> > > +            reg = <1>;
> > > +            gpio-controller;
> > > +            #gpio-cells = <2>;
> > > +            #interrupt-cells = <2>;
> > > +            interrupt-controller;
> > > +          };
> > > +        };
> >
> > As I (and Arnaud) have stated before, I don't think this is the best way to lay out
> > bindings for rpmsg-gpio nodes.  I am currently thinking about a representation
> > that aligns better with other virtio devices.
> >
> 
> Hi Mathieu,
> 
> Would you prefer that I wait until you finalize the layout before submitting the next version?
>

Let's wait until the DT format if is finalised.
 
> Shenwei
> 
> > > +      };
> > >      };
> > >  ...
> > > --
> > > 2.43.0
> > >
