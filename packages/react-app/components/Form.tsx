import react, {useState} from "react";
import { createDoctor } from "@/utils";

const  Form = () => {
    const [useDoctor, setDoctor] = useState("");

    // Creating a doctor form logins and details

    return (
        <div className="flex flex-col justify-center items-center">
            <div className="h1">
                The Lifeline App
            </div>

        </div>
    );
}

export default Form;