Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B501345EBB
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 00:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786409971; cv=none; b=Vq/thbfFhen0bgpNm8AzQVw2qfEDlBTVN5muC5/0rVKg8bqji3t2xKxsGjL9BH0sJJEyvCuto9Jbrc1gpe3W9dYDeuTYdoq9fOqhgmzuwJYqo1hZR6oNTwScsrTYYS0Twk4yk5uqC8oxsCueKhBTzuwN5MWETj6t1daW9Ov8O3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786409971; c=relaxed/simple;
	bh=CjQdVStJQcg91fypKE4K5Vi9xyVllTpeBG6sOBpJYuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKGsf6dxpThJDYSRLxCyk1kFkVnV5RYneRg0HAswzn0hoLcMy3NfQHrE6suA4/b1bBGplJbqG84tDdwyI7CXdsNZQSk+ccY2ecx/O/GbtQIcvVyXGxTLYf5LJ+Ru897aTTwB60XJLd8iI7Ezv75UYotm74OXxOqTE5zlGXG6Q/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=boGzuW7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFyZv1ou; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="boGzuW7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFyZv1ou"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMpowu2649804
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 00:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e9W/tZpD/0Zo9zxxG/FneZtf
	2PKBjRMlIQfVAZ5Cf0Q=; b=boGzuW7dpQigYVrUnFqfcAXRPzuyN5Jfba/ujZeK
	4jsBl8VnJNbxHud9+5Nj4STTW8npTbZvxDn3bLp+iRu6dcEc5cZAiSQ3RhFYjX9R
	oN/jw5h3/EWCjLrhgaRadWhSr76LSHYc0sI+9i3WefzTWE+BRB8vnjcLvI9GoHvC
	Pe8T7juXejAz2y/iUMCsB8rbgSfxx4hvIUjs1AJlIpmRNDsaeylzq1SgbZaAmLzW
	KIXeCrewM5amBg+Q/bZ6wYRsgcje/uNEUk9uVd+Ym1qjMmmWJg9PBU4bOIVuUdyn
	Oam25Filam4A8zHm3QJXDbBcAV2sTVwMQumq8mNG0lg8IQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccquk1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 00:59:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso34846621cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 17:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786409965; x=1787014765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e9W/tZpD/0Zo9zxxG/FneZtf2PKBjRMlIQfVAZ5Cf0Q=;
        b=EFyZv1ouKOxipAhpXtqg5KcHX5XwFdcX1lpOYkiVR/6/LtKGRW0cBrkr5IkOqad84d
         38wSbaiS2duLhq03epEa2xCEWv2knctuoKzkUrnbtCsIreua7uj4VihE08kEds1xBwAA
         r6QKxNPCOZXWQikcb+DwxTYVJdZ7X3L4D631RRjcjFGYMC+zMCZf7Q7Z/CDRNS20BqdU
         Ld3RmndbW9rIo1/jdGDHHDn8ozo19auu+yR/CYpaN3/7/KOFGcojGecSRZQe5baZmEQQ
         Y6RJl0W8Ifl9dX9KM5JNFjPPo9VUjYfc00RRKbgCE+SWchLd+jd2SgfYQ9IZ9Ohb15S+
         qVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786409965; x=1787014765;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9W/tZpD/0Zo9zxxG/FneZtf2PKBjRMlIQfVAZ5Cf0Q=;
        b=jI58vvR6EQJko82B+ThJKfWp7Z3KQRhFiE24fRwqzPT59dj01zium6nteq0uUxnYCZ
         rX2jzYeVwFcHtedIrvlOV7iUeC1uKr9KEdIjNiHoA5ohNmLZbEJ3Z5Ij5953e9onuOnc
         xXkjcdalSE4vULhFwRc0o4U6uWyXkkAq1YPKI+FdT2TTq1MxXP/fEhNrVfZIaFCIsP5v
         0Ar6FLrxZ+D+v3aI1oEjB3kd7zgSamaXuq8BbdRdZEXpZ/3DWUS6YqfIdyqxdml6nN6U
         0jwp7IK7WIUEFK25bg5Eny7a+p7UdupBehAaxPlGLhv05tNSUDrPB1SERk9VPefL/4kC
         dXjA==
X-Forwarded-Encrypted: i=1; AHgh+RpfJEI6+ycRvmNJ/0HNgrUYTNh5Gxn3W/hYEy834JPuiq0RciMb3hhQg8h5jYjTkpJpmuZBrsXjE75x@vger.kernel.org
X-Gm-Message-State: AOJu0YwVbIK2PpBQA8s5JRwvTbGpCbGoPFmeYtnNytrk4dHt3/FAI1f9
	9qf63E3b/3e8l5e9tLZDRYlxau5QBLZCrftXbRKzOi9ZvD2OeBkfGkNbznOfbnwoveYJhyq618a
	9K3ZB8Ntlu90p/76OBHvQPzXYynDwWgDfeJJ4y6dcEdI5Ic+rQ/7PG04+AEDV7qDo
X-Gm-Gg: AR+sD10mTtjsUUvG9deQr7mkqYu9mDmFE1ZYgemN6otdEq+hqLD0JFFq86RFEwkZgb3
	sdVtqo4COoD37OUqivAP7eBWrxxOnAxD88U+lKiB9MA5myxCU7d0x1eD8IhqBUkit1OJfZW0uWG
	GNeu9pCZHM+rX+58E7ivf3RUASbwfk7CClYqS2g+3CBZD14FMeAPckYtFa5EuXM4ZlGIuSEF2Fx
	OvAjmZSOBxwRoW5dwfzbxQgOaVcACRkuSdoIutAnLS7rknOJ5e3pFeB2BnAX48OhnwH+CenF25a
	bK+b8eRY56Qnfiba5OWRp696yMjq1thMplhWjcAihpeSq86lPk3DUeioMjh/SldXRAXZO5KUIoG
	s5yU2zBR/2C1/S1xPrZdlgGNzzocDV8/trUABap3mxmQAZXssgiEcdt0rQ2g2WVp7JNeh+A9kZy
	8mUx1zGA8Ug4jKwA==
X-Received: by 2002:ac8:7dd0:0:b0:51c:1e2f:1281 with SMTP id d75a77b69052e-52d191dae3emr263411891cf.42.1786409964902;
        Mon, 10 Aug 2026 17:59:24 -0700 (PDT)
X-Received: by 2002:ac8:7dd0:0:b0:51c:1e2f:1281 with SMTP id d75a77b69052e-52d191dae3emr263411431cf.42.1786409964426;
        Mon, 10 Aug 2026 17:59:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b304fd1c38sm2227656e87.12.2026.08.10.17.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 17:59:21 -0700 (PDT)
Date: Tue, 11 Aug 2026 03:59:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
Message-ID: <vexqghyxtf5ntmu5mpijgql7atlzhci5fhde2j7gyrw4f2tpdn@pm2qzwtefmrv>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-6-5e0ede4a0c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-kuno-soc-support-v1-6-5e0ede4a0c72@oss.qualcomm.com>
X-Proofpoint-GUID: V-36YLYHbJoszU6VvOlHkN7Cik-MtnNQ
X-Proofpoint-ORIG-GUID: V-36YLYHbJoszU6VvOlHkN7Cik-MtnNQ
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a7a73ed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=IkUaqJR2pzUdpQOAnGkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAwNSBTYWx0ZWRfX119rtwxDfbZd
 1avzUjgTjhOkLGaxGpsD71c0qj7+eO8hWDVK3HyPCT+3Ps4/UHPiIXNIkUx6FtTF9evyg/FkdXn
 wzePhpKIFblIzsnaI6pcq9OPIctNslAEUbyiqKjLtFcXdCnSawXq9pH6CUskIwfGcEMbkYlMCzh
 LoOP1TmbB10R3ybU5Y4dCZNXgVTpnviHfrn0v16U1ZRcSr8QZ5zJJdwxKHIK4CxiGK4fkC3xEw8
 frtoTHcJ3LF+ZK9akmdFHxjLT9OoWWLiruEk4oBOtTUoV8BHRJfb0v4hcCrjVvgZ0YaUQ7eW7cX
 CftgbIYWfhPUBYD9tMn0RLL5ROQdxYL4txWu+Uw3LepnF3WyIupHjmCy0OlXpAUWbyXufeLJBZO
 YyKc2/0DItEvcJ9IVUd2hBUoR3z+t4CFRnOl5uS4qgmnQr1Y/AI/ytP03ye2ZP/97uGK4YudrVk
 tSWaYa7m7QtEwLGztNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAwNSBTYWx0ZWRfX2OpB+5HdwiJr
 faR8OsXF0IF21lCyNqDqOY/YKrygigUGsQpG7Wf9t9MiUZr8GQGWX2VoJuXxNQlDLB/8ivZ1BZA
 8hDMyFsRu40tarAVVqRK0asjIlLbecE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110005

On Sun, Aug 09, 2026 at 12:57:05PM +0530, Hardeep Sharma wrote:
> Add the Devicetree bindings and node-ID definitions for the RPMh-based
> Network-on-Chip interconnect providers on the Qualcomm Kuno SoC,
> enabling DT validation and interconnect bandwidth voting.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,kuno-rpmh.yaml      | 72 +++++++++++++++++
>  include/dt-bindings/interconnect/qcom,kuno.h       | 89 ++++++++++++++++++++++
>  2 files changed, 161 insertions(+)

Are there no clocks requires for QoS?

-- 
With best wishes
Dmitry
