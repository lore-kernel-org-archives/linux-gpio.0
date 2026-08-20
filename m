Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0AC3D7D6C
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 08:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214282; cv=none; b=K1aeaWPdItl2JEnwF11I9r0uMVu9vi+MtlBTdratVsJtmB39+YfjTfRmrE76ERO8dv6kirXvxluUdSdlt99K9pwJ0X6pdMdUsd0NsjOcf36Wk11o/I4XRq4sdqOKpRbz4UWVzcRW//JCk4UCSX0X82UpoHjWHduiO9fBo0t0UsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214282; c=relaxed/simple;
	bh=uhbvM1A1lkYcLVt0VEQC+1D0xdK/L0Qexms2FDRDGFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ug+BobcBCst4gaJUg65ABa+MtwzMX31qgAF2C+aaRWVTwDCI430jfNUlqiKVYGraFq0F38c7e5N7hBniB+JPdIBqR0oBmvEFsSOrcmD4HymCZvYOrLaUqqIuos8fplHlgGHX95KeZlvlmIUIw/hcBTOWnucuQik7YQHA+BndW1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVxTZkdT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WVb8xATf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVxTZkdT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVb8xATf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K65mbh1258546
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 08:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tx3cBEJCJNmhBvYLSTPoH6tb
	pxzqlnwnHOBsIUd32DI=; b=pVxTZkdTM6PNoYSvxz8XPpU1yOKNTKRQgfbI5drW
	uZmB6b9/y3U7h7vvS6UVvlfWIrKp6l67LN6n23kg/PAFrh/kXmPbU83byOAs/WOX
	p0evbQAYZTLQZ/vn9T6NIQzGCraWBm89Vp9o+Dd6/faOZnt7DzcJ5kYVOQr1dljL
	vG6MkYh0LDuyQXeuILV9+McWl/5HZeXBEL6UJ+hpPXFgYlkJbXeLsm+27vB2v4Xc
	3BR/WKFDjtcWdYoArNm+I73WGSy3YhZ63SL9pjDImtYkujElRgpTXC/F5vzAETvF
	SOCWZeQ5Dt82HvKrUMUJdP+xZb2hbpIAocgpL7+EFfJ/gA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es63up5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 08:24:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so23689511cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 01:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787214279; x=1787819079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tx3cBEJCJNmhBvYLSTPoH6tbpxzqlnwnHOBsIUd32DI=;
        b=WVb8xATfqpi6PUaPgC4NKa4G34RrjwPT5epQ5fV3FTwfK7pk1JHPedqa3HrngQ+ccG
         YeOf67GXvn6/5VBlD4IffOQ0HRlM8VyUsA1Z19KTwhlGKWbwpPgXG8mS2LNBNeyrY2bV
         /cBEZNl+nCszxsdpq2s7Xqy3Q9EGKcqTGuQV5P82i+r/4RIBlJdiGzac7R41HCVPQZSh
         elOcIRUQG4nyEdRXai/vAO41AcsjiFu4lKgeGgLUF0rofB6DOqPzncOGtFwMhpM7VBUE
         R4jbLwALBysbYi9O9AhRevPc2FTv95U9rRQbzPMNZYP0cmY6vvcMcCSZEPnemX9fPazp
         2JYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787214279; x=1787819079;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tx3cBEJCJNmhBvYLSTPoH6tbpxzqlnwnHOBsIUd32DI=;
        b=AewzQExlgP7/vADnrhQXR3I1ooz4Hc3zQh5hFiGUMCzdhrYrtfrZewd8PQl7OFWeR9
         ErT8zpygh+H6+RSNyF/PMYWJ4UE1V5WVNzw6SWxqPZVHdI5FGiXmerN5Ss6IglgHXOUp
         j8KIBybqjczOnr4b8Lpo0Fu9Ke5YjyX68RD0PpiBKjIMDNnLd8Mr7+CGoc9ISEh+ik/Z
         khzLvVebqykMG6zQ9/+lCN91nO3uEBvqb4E6HXt8DooCjWWchqOOnINEotynh7vo5Xc9
         Sw1fq2AoswZysvtwgReURvgoINGVm0iCl+fKxapZwcjpJ5PvqjZGhRpJvWpK0T5hs/6h
         xJbw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5+Feb1t4qNkEhedNTx+ONkbdpybCtghEyf2U60QCXrEDHrL6v7WIi0U9VbfWdy5DRRfC1ebEjLHOj@vger.kernel.org
X-Gm-Message-State: AOJu0YxGsBV+fCRF3tNE+ZoH76jomFYCUljjWkmzrVof7Qz8ZclD0nzH
	aKvcSVWTHYuWyajYduUaeBl9GMCOYwoBtvEARKxevYRikXRc63lCsYa67wN9zz+MDhbNxv8Lv/o
	9CoOfr7iMdJHN9UTtlv2vXH3AOk5sNHbA+/iIIqiRqPLlo3PmWL/iSiHpZ9WRZLew
X-Gm-Gg: AR+sD11cNKPqDJlsSH/9Ei/oUg19SZKBAgWpTzOCs2mAVmDBSxYkBOT3vo8ZLO8wV0s
	S6Tbg3FUygj3qy/mCQqzez78yKbyigtuONE0PtKR0NXX3RlSMiTetkWItW9/CnYdkSZ5k+uJEQU
	j2xmVY5sRbHsg7jsmYM58HWO7TRb4Z/6oZ6WPFmBb+RYm2/9iACPjQJ1RhZvOcirZkVxY+6l01Z
	tZNGGgMM5hPnhqwQ4xl+whNdSG1GjPM/EJKWSHhYA8o9c9qrfbkW3AdnadZXrmwaUP7hcAxhQKD
	rTFZQvS6ij0x8ANnlvL558H9HMCKN6ludna3NhevHcsCDf4f5tLKzo1m7pPKL/u69T+eBohIGMA
	r82Wy3aub8rOGkrM=
X-Received: by 2002:a05:620a:458d:b0:936:d2a9:1dba with SMTP id af79cd13be357-9371e204e3emr846861985a.1.1787214278640;
        Thu, 20 Aug 2026 01:24:38 -0700 (PDT)
X-Received: by 2002:a05:620a:458d:b0:936:d2a9:1dba with SMTP id af79cd13be357-9371e204e3emr846858085a.1.1787214278101;
        Thu, 20 Aug 2026 01:24:38 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c46f2sm12926289f8f.29.2026.08.20.01.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 01:24:37 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:24:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 10/10] ARM: dts: qcom: apq8074-dragonboard: enable the
 HSIC host
Message-ID: <unxuswp7lghhaa64rcerxdxi3n3sc6oz3iket6mf4z7hqtji42@7temhlkxanse>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-10-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-msm8974-usb-hsic-v1-10-e5f93ea76ffa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=E5/9Y6dl c=1 sm=1 tr=0 ts=6a86b9c7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=u23MIztejtzZNv9v5ywA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: d8ylsQIfU_eNkrehJvUezjLITgrzCiye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA1OSBTYWx0ZWRfX1VY5JSBkvJx+
 l1rW45o/vSMoVajNOACH6psTdfA4IMJS+wZ7nESXQhkr7utNLdIkHp9A5pFfYebQ6jP1X3HhTqh
 cyb6Ry2NYWhrAjg0Sz0Xa7TqoetZzfdQFrMRxAPighlS2tD6xBX7s/l7KoKXzJHCDVrd5MYLq3W
 r3rviYOGfH5QDVdWislYMTAHs/Os/XbAAIxB+Dx0XUUXWQi2z/4xyh4H7tCKZzKGLketoMeMSBF
 fdJGSzGk2lRhQZwxJyQe0Gxrq32WrgtDFLZiP38m4jb9espCxDzp5pJ7gzFk4oHC7mju7dRngUn
 lxiH3b6kBZg73BecfYiuGkjloDih1VduYpqJxAndFhiKpCDFySzsOvOsDt3DTfQU2uMyZUyH9v7
 4aKgWqZz7Ssc7/xDFLrEludhnVZzWa45AIXT31CwqMy0YQ48IpC88d90Kh9tCVoM9L3HWZw763v
 1eVlkOT2qsZelo3L04g==
X-Proofpoint-ORIG-GUID: d8ylsQIfU_eNkrehJvUezjLITgrzCiye
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA1OSBTYWx0ZWRfX9zYVo3zhSntU
 AQH0lP9oXyydOmEHuX4Yee3A6TLQ7vpT8arRqoQdVhrsWa0N5UtTWDuOGx++G8HIJm94RQz3pgB
 gYVZkF+sXpfjn3DfCOEwzDoUcZ4mVVc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200059

On 26-08-10 18:42:14, Dmitry Baryshkov wrote:
> The dragonboard carries an SMSC USB4604 HSIC hub, but with the HSIC
> controller undescribed the whole HSIC-attached part of the board is
> dead.
> 
> Enable the HSIC controller. The USB4604 hub isn't controllable through
> the I2C because of the board design issues, so reference it as a simple
> USB device, describing the reset line.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
