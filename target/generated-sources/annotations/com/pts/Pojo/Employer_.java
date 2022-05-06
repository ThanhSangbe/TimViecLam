package com.pts.Pojo;

import com.pts.Pojo.Province;
import com.pts.Pojo.Tintuyendung;
import com.pts.Pojo.User;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2022-02-17T19:58:47", comments="EclipseLink-2.7.9.v20210604-rNA")
@StaticMetamodel(Employer.class)
public class Employer_ { 

    public static volatile SingularAttribute<Employer, User> idUser;
    public static volatile SingularAttribute<Employer, String> country;
    public static volatile CollectionAttribute<Employer, Tintuyendung> tintuyendungCollection;
    public static volatile SingularAttribute<Employer, Province> address;
    public static volatile SingularAttribute<Employer, String> logo;
    public static volatile SingularAttribute<Employer, Integer> id;
    public static volatile SingularAttribute<Employer, String> title;
    public static volatile SingularAttribute<Employer, String> slogan;
    public static volatile SingularAttribute<Employer, String> email;

}