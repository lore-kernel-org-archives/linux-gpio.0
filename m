Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161943DD85C
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638719; cv=none; b=LQ0iTqwlfqmGLQQmDhLEz0h5ejZRUJAfEzLMQ0rKVGYqO08wHfgM5qDVU5ggpWjsvMeC36TdRJWoBwpH0Z2C5ORX28wxuDa5tMILMGUMhHzQ/dpP6EA3jY+ELrmrOHpelCLJTMwGJrIY37J1mfuh06B8QAtq8KHpO/ZIWpWIjNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638719; c=relaxed/simple;
	bh=9dI6DB1nFlmSg6xfpztBajLroSCF+JLr20XiIWhZRvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JJWB3G9iYhecHBeycf/GfJlQ4GoqzJBGNNgrG8bYnBhGrFO29RVoqYaKEO3W9tihBI2X1/Jappvqc9CL6eptksFDRtPmIYioMgkHlZwqhbhvMAQiTkdf0cWTEXFF3yXut3VYRyow3NVqzLaac0bnSBV5HzvvmjhSq9Zr9xTaNEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TVipXOq/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEeMTOGy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TVipXOq/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEeMTOGy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZcDo1257865
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O3S827YcS2T8v900TfM9zh39iRTg/vCLOksDludBz8E=; b=TVipXOq/3nlgGJmA
	fm+jqyhdgRMwNQ8iJT41ZyVQGZVHT4i9FleLLaC6Tr+uAYfkuY+i6sKbBQ94fS+l
	zTA+K6WbcWI3RIA6Z0paB/5Q208ma1qUJyqehGKPn9JSw1GGLSK0PKzyW+k3CCHs
	iCoBIhufAQtUN9XL1HgCd8Zvv05KQckArAecQ54aTZJP3nA2Y0fbzh3moPp1uRWO
	HJXDPOgTPBVsUK6Cmfjul8dJyNtOsF0xAHWZYQLKgKHNLnc2RKPAF+D9V27+8Tss
	JW96W4/tJMVX/Fadw43EpWCxLHkhIaUZLG1IBhdI10viHCCU/UGkulOicM4y2EE4
	88q8Rw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftg45g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:51:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939062ecda9so103329985a.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 02:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638704; x=1790243504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O3S827YcS2T8v900TfM9zh39iRTg/vCLOksDludBz8E=;
        b=FEeMTOGyeFP3wMcBhQ6O03N6uiMUMOP+bl8SWLAJ22sv1RFz04s3j11ZZk+LebSqlr
         vDHwZC7KNPPx/N5AhSZd+pYPmRS+HRyII54o3kI/HDvxQfOnmiGTUlv1To2Yd7ElRPnZ
         D5ANbOKjZBxQMlydKl6gsoxEYqJjotqU/w20yXpuZZ4zFcPWjn3JRn4o7kgzvWmmDvdm
         IMwdnGVa9ZnVQHbZrYL+3/l1A2pekcdkGl87sybB9zzMFO72vXdUFP8jDHZJ7OCtZXzj
         zSKc5vSfzxkfS7GUC9nARbQ4fTf5Eidp2JDFW6iSVzdzQMV3Tv9YQmkpiyKa63Ja/T33
         T4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638704; x=1790243504;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3S827YcS2T8v900TfM9zh39iRTg/vCLOksDludBz8E=;
        b=ryFhWFKQ5jLlTxEeIt8pZOxx2luGDW6n02f0R+gJPFwvS/5uDHK6i6pDD1Q4jmo3Tm
         HU4XRzXdYTbHakE4zO497jk3OcKFPA9azvai81eESCHTJmMGj0nGqing0DGVKsF7wr5v
         cIY7SsWAfsr3ow/hheZnEQBTO5BAhFNrK523qEuShB6u14tVObAIItmwN85bwB01nS14
         N/rALj0uP9tKksOC8cVntwoz7ed2mgZLehImHyn8t+X8gEWTgqz+52yxePlOBHlxZegG
         P+YwrmXG2fWcZHk/xsTwW5BZqpEbJh+uN0WBDlw/4kaRq2dy5yvLu4EpK7jIOcNHoO4e
         Aovg==
X-Forwarded-Encrypted: i=1; AKwUvBxaoynKy05V581gMtpLcYNlKj4/qj8aLdQei0dG3d/5imtZNSHcSnw/yHopy83XLKW2Z3mRTJXjZuWV@vger.kernel.org
X-Gm-Message-State: AFuF++mWWs9qtp6/piS+7861m+MofTdzTPEwGgw3PGzZKaDz9P4qgQbB
	3OlkRhM0m/BUZrZs7ut8q3avaTD+xyo4hNqKI+zWCV6nhoIcRv7SejcKBCyDpxlqyWTWKhgzE62
	k6XOGrJrr6gauWU3ofoPCnldQnZhcNhq0mpbqkcoe1GJH/yndVQxh4Mm3m99iDd9a
X-Gm-Gg: AYBFou2YOp8XleSTwWC5G4Sfn4MsXNtILycGhICIvb4kzBvLUuEi4owxOtVkV32BSRW
	I9JNDps27acvnBUegQd+yUCd8q7mPHCr31MjowKjF8UggfdB8BzuQhCCT1EabQsiK9nutS0/pUb
	d5bN4Mp9pb2N1sn7AN+Ra3LqsUK7vKvTqMW2x+y4uPfGiR5NM40blS4eOFxWCH3OcuwJlqZ4g67
	WhwB3mTj6dUBLAISqnZyp6x+lpCETG6guW80k5lS3H7zs8rPqmxZBqNkTdvxFIBWD3gisfS6ihF
	nFGovLhkpWgaxq1njVEQBzGCcvAtJVNWWgvlN4cZSb+GzM1ijsRGk3CoZMKeZaf2iPaM7jlAikw
	xsmF1LwawpQMtsvHWhr62+sHNUMY=
X-Received: by 2002:a05:620a:40d4:b0:939:d762:e2d8 with SMTP id af79cd13be357-93bb789cc9cmr802501085a.31.1789638704483;
        Thu, 17 Sep 2026 02:51:44 -0700 (PDT)
X-Received: by 2002:a05:620a:40d4:b0:939:d762:e2d8 with SMTP id af79cd13be357-93bb789cc9cmr802498485a.31.1789638704099;
        Thu, 17 Sep 2026 02:51:44 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbfd935cfsm27089605e9.0.2026.09.17.02.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:51:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, Wentao Liang <vulab@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        ckeepax@opensource.wolfsonmicro.com, linusw@kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: arizona: Fix runtime PM leak in arizona_gpio_direction_out()
Date: Thu, 17 Sep 2026 11:51:40 +0200
Message-ID: <178963869732.7792.14538092386135912538.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916094701.2007509-1-vulab@iscas.ac.cn>
References: <20260916094701.2007509-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfXzH4oPmU6yfC3
 3KrN3ScJDP39aeaq089RAc1xpHVuqh7NDxNUc/e9zlfNdXJBQttWryZ4d38totthbT4wUpK50X2
 Uy5OIcutUjSGG1RtoQoG4zrfeRgUDTQcPJzd9giJT6iFBNJa/GCDw7KTxQR6D4icZleCwi39rYq
 sVfvC1m3KCg4/bBfGNz6ue8rxGsuKdbJ9Anf4IoLgLROWIhJPJoyn+N2GQqBtbtjTBzplVK82tU
 U4tDj91VoCIiG7BJOk5xdCgWRIE/GPWW0chDk0+fY+4tgQGM8DLZjP8nF6430aDL1LkWeYu7bFx
 cI45Gwcef4rhrtbNCK4djtqBXZk8H/BUtnruDQ23cso7dNspql3g8AgK8KVDj0hA+JAhBaI/IPF
 W81nBdpIXXbk6F8eZydm1eJH3hCwY8Ofjduc+DsoE2eV8z4ZBj26FAJh0k/d8L57CQdO4lSpCkq
 z794kgkHe7Ik6wSzosw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX1w6Ol1b5FRv0
 uGaBDgdmt0rTNrU/wQ2ffOC8f7aGw5kDrFmJU35UOu3dGMz3Vv833mif3vw+UTnftXWz/qhpeMs
 gkBXGTFN/86nRPXg7K1lwzNkAttVP9s=
X-Proofpoint-GUID: cLpbmr6YkAgNlnWkGAsWi0xVn90rn3oD
X-Proofpoint-ORIG-GUID: cLpbmr6YkAgNlnWkGAsWi0xVn90rn3oD
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabb831 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7NPxJkk6BdN3bhC987UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170135


On Wed, 16 Sep 2026 09:47:01 +0000, Wentao Liang wrote:
> Switching a persistent GPIO line from input to output acquires a
> runtime PM reference on the parent device, but if the subsequent
> regmap_update_bits() fails the reference is never dropped and no later
> direction_in() can balance it since the direction was never changed.
> Drop the reference on the update failure path.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: arizona: Fix runtime PM leak in arizona_gpio_direction_out()
      https://git.kernel.org/brgl/c/e9d810279f84b30738f7790c0ed15f8dd5b9024a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
